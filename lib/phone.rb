# An object representing a phone number.
#
# The phone number is recorded in 3 separate parts:
# * country_code - e.g. '385', '386'
# * area_code - e.g. '91', '47'
# * number - e.g. '5125486', '451588'
#
# All parts are mandatory, but country code and area code can be set for all phone numbers using
#   Phone.default_country_code
#   Phone.default_area_code
#
require "phone/country"
require "phone/errors"

module Phoner
  class Phone
    module ClassAttributes
      attr_accessor :default_country_code
      attr_accessor :default_area_code
      attr_accessor :named_formats
      attr_accessor :n1_length
    end
    extend ClassAttributes

    module ClassAttributeAccessors
      def default_country_code
        self.class.default_country_code
      end

      def default_area_code
        self.class.default_area_code
      end

      def named_formats
        self.class.named_formats
      end

      def n1_length
        self.class.n1_length
      end
    end
    include ClassAttributeAccessors

    NUMBER = '([0-9]{1,8})$'
    DEFAULT_AREA_CODE = '[0-9][0-9][0-9]' # any 3 digits

    attr_accessor :country_code, :area_code, :number, :extension

    self.named_formats = {
      :default => "+%c%a%n",
      :default_with_extension => "+%c%a%nx%x",
      :europe => '+%c (0) %a %f %l',
      :us => "(%a) %f-%l"
    }

    # length of first number part (using multi number format)
    # default length of first number part
    self.n1_length = 3

    def initialize(*hash_or_args)
      if hash_or_args.first.is_a?(Hash)
        hash_or_args = hash_or_args.first
        keys = {:number => :number, :area_code => :area_code, :country_code => :country_code, :extension => :extension}
      else
        keys = {:number => 0, :area_code => 1, :country_code => 2, :extension => 3}
      end

      self.number = hash_or_args[ keys[:number] ].to_s.strip
      self.area_code = (hash_or_args[ keys[:area_code] ] || self.default_area_code).to_s.strip
      self.country_code = (hash_or_args[ keys[:country_code] ] || self.default_country_code).to_s.strip
      self.extension = hash_or_args[ keys[:extension] ]

      raise BlankNumberError, "Must enter number" if self.number.empty?
      raise AreaCodeError, "Must enter area code or set default area code" if self.area_code.empty?
      raise CountryCodeError, "Must enter country code or set default country code" if self.country_code.empty?
    end

    # create a new phone number by parsing a string
    # the format of the string is detect automatically (from FORMATS)
    def self.parse(string, options={})
      return if string.to_s.empty?

      Country.load
      string, extension = extract_extension(string)
      string = normalize(string)

      options[:country_code] ||= self.default_country_code
      options[:area_code] ||= self.default_area_code

      parts = split_to_parts(string, options)

      pn = Phone.new(parts.merge(:extension => extension)) if parts
      return pn
    end


    # is this string a valid phone number?
    def self.valid?(string, options = {})
      begin
        !parse(string, options).nil?
      # if we encountered exceptions (missing country code, missing area code etc)
      rescue PhoneError
        return false
      end
    end

    # split string into hash with keys :country_code, :area_code and :number
    def self.split_to_parts(string, options = {})
      country = detect_country(string)

      if country
        options[:country_code] = country.country_code
        string = string.gsub(country.country_code_regexp, '0')
      else
        if options[:country_code]
          country = Country.find_by_country_code options[:country_code]
        end
      end

      if country.nil?
        if options[:country_code].nil?
          raise CountryCodeError, "Must enter country code or set default country code"
        else
          raise CountryCodeError, "Could not find country with country code #{options[:country_code]}"
        end
      end

      format = detect_format(string, country)
      return nil if format.nil?

      # Override the format IF overriding options are not present
      format = :short if options[:area_code].nil?

      parts = string.match formats(country)[format]
      return nil if parts.nil?

      case format
        when :short
          {:number => parts[2], :area_code => parts[1], :country_code => options[:country_code]}
        when :really_short
          {:number => parts[1], :area_code => options[:area_code], :country_code => options[:country_code]}
      end
    end

    # detect country from the string entered
    def self.detect_country(string)
      detected_country = nil
      # find if the number has a country code
      Country.all.each_pair do |country_code, country|
        if string =~ country.country_detect_regexp
          detected_country = country
        end
      end
      detected_country
    end

    def self.formats(country)
      area_code_regexp = country.area_code || DEFAULT_AREA_CODE
      {
        # 047451588, 013668734
        :short => Regexp.new('^0?(' + area_code_regexp + ')' + NUMBER),
        # 451588
        :really_short => Regexp.new('^' + NUMBER)
      }
    end

    # detect format (from FORMATS) of input string
    def self.detect_format(string_with_number, country)
      arr = []
      formats(country).each_pair do |format, regexp|
        arr << format if string_with_number =~ regexp
      end

  #    raise "Detected more than 1 format for #{string_with_number}" if arr.size > 1
      if arr.length > 1
  #      puts %Q{detect_format: more than one format found - #{arr.inspect}}
        return :really_short
      end
      arr.first
    end

    # fix string so it's easier to parse, remove extra characters etc.
    def self.normalize(string_with_number)
      string_with_number.gsub("(0)", "").gsub(/[^0-9+]/, '').gsub(/^00/, '+').gsub(/^\+00/, '+').gsub(/^\+0/, '+')
    end

    # Returns an array of the number with the extension removed, and the extension.
    #
    # Example:
    #
    #  number, ext = Phoner::Phone.extract_extension("+1 (123) 456-7890 x321")
    #  # []
    def self.extract_extension(string)
      return [nil, nil] if string.nil?

      if subbed = string.sub(/[ ]*(ext|ex|x|xt|#|:)+[^0-9]*\(*([-0-9]{1,})\)*#?$/i, '')
        [subbed, $2]
      else
        [string, nil]
      end
    end

    # format area_code with trailing zero (e.g. 91 as 091)
    # format area_code with trailing zero (e.g. 91 as 091)
    def area_code_long
      "0" + area_code if area_code
    end

    # first n characters of :number
    def number1
      number[0...self.class.n1_length]
    end

    # everything left from number after the first n characters (see number1)
    def number2
      n2_length = number.size - self.class.n1_length
      number[-n2_length, n2_length]
    end

    # Formats the phone number.
    #
    # if the method argument is a String, it is used as a format string, with the following fields being interpolated:
    #
    # * %c - country_code (385)
    # * %a - area_code (91)
    # * %A - area_code with leading zero (091)
    # * %n - number (5125486)
    # * %f - first @@n1_length characters of number (configured through Phone.n1_length), default is 3 (512)
    # * %l - last characters of number (5486)
    # * %x - entire extension
    #
    # if the method argument is a Symbol, it is used as a lookup key for a format String in Phone.named_formats
    #   pn.format(:europe)
    def format(fmt)
      if fmt.is_a?(Symbol)
        raise "The format #{fmt} doesn't exist'" unless named_formats.has_key?(fmt)
        format_number named_formats[fmt]
      else
        format_number(fmt)
      end
    end

    # the default format is "+%c%a%n"
    def to_s
      format(:default)
    end

    # does this number belong to the default country code?
    def has_default_country_code?
      country_code == self.class.default_country_code
    end

    # does this number belong to the default area code?
    def has_default_area_code?
      area_code == self.class.default_area_code
    end

    # comparison of 2 phone objects
    def ==(other)
      methods = [:country_code, :area_code, :number, :extension]
      methods.all? { |method| other.respond_to?(method) && send(method) == other.send(method) }
    end

    private

    def format_number(fmt)
      result = fmt.gsub("%c", country_code || "").
             gsub("%a", area_code || "").
             gsub("%A", area_code_long || "").
             gsub("%n", number || "").
             gsub("%f", number1 || "").
             gsub("%l", number2 || "").
             gsub("%x", extension || "")
      return result
    end
  end
end
