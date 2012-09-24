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
require File.join(File.dirname(__FILE__), 'support') unless defined? ActiveSupport
require File.join(File.dirname(__FILE__), 'country')

module Phoner
  class Phone
    attr_accessor :country_code, :area_code, :number, :extension, :country

    cattr_accessor :default_country_code
    cattr_accessor :default_area_code
    cattr_accessor :named_formats

    # length of first number part (using multi number format)
    cattr_accessor :n1_length
    # default length of first number part
    @@n1_length = 3

    @@named_formats = {
      :default => "+%c%a%n",
      :default_with_extension => "+%c%a%nx%x",
      :europe => '+%c (0) %a %f %l',
      :us => "(%a) %f-%l"
    }

    def initialize(*hash_or_args)
      if hash_or_args.first.is_a?(Hash)
        hash_or_args = hash_or_args.first
        keys = {:country => :country, :number => :number, :area_code => :area_code, :country_code => :country_code, :extension => :extension}
      else
        keys = {:number => 0, :area_code => 1, :country_code => 2, :extension => 3, :country => 4}
      end

      self.number = hash_or_args[ keys[:number] ]
      self.area_code = hash_or_args[ keys[:area_code] ] || self.default_area_code
      self.country_code = hash_or_args[ keys[:country_code] ] || self.default_country_code
      self.extension = hash_or_args[ keys[:extension] ]
      self.country = hash_or_args[ keys[:country] ]

      # Santity checks
      raise "Must enter number" if self.number.blank?
      raise "Must enter area code or set default area code" if self.area_code.blank?
      raise "Must enter country code or set default country code" if self.country_code.blank?
    end

    def self.parse!(string, options={})
        parse(string, options.merge(:raise_exception_on_error => true))
    end

    # create a new phone number by parsing a string
    # the format of the string is detect automatically (from FORMATS)
    def self.parse(string, options={})
      return nil unless string.present?
      
      Country.load

      extension = extract_extension(string)
      normalized = normalize(string)

      options[:country_code] ||= self.default_country_code
      options[:area_code] ||= self.default_area_code

      parts = split_to_parts(normalized, options)

      pn = Phone.new(parts) if parts
      if pn.present? and extension.present?
        pn.extension = extension
      end
      pn
    end

    # is this string a valid phone number?
    def self.valid?(string, options = {})
      begin
        parse(string, options).present?
      rescue
        false  # don't raise exceptions on parse errors
      end
    end

    def self.is_mobile?(string, options = {})
      pn = parse(string, options)
      return false if pn.nil?
      pn.is_mobile?
    end

    private
    # split string into hash with keys :country_code, :area_code and :number
    def self.split_to_parts(string, options = {})
      country = Country.detect(string, options[:country_code], options[:area_code])

      if country.nil?
        raise "Could not determine country" if options[:raise_exception_on_error]
        return nil
      end

      country.number_parts(string, options[:area_code])
    end

    # fix string so it's easier to parse, remove extra characters etc.
    def self.normalize(string_with_number)
      string_with_number.sub(extension_regex, '').gsub(/\(0\)|[^0-9+]/, '').gsub(/^00/, '+')
    end

    def self.extension_regex
      /[ ]*(ext|ex|x|xt|#|:)+[^0-9]*\(*([-0-9]{1,})\)*#?$/i
    end

    # pull off anything that look like an extension
    #
    def self.extract_extension(string)
      return nil if string.nil?
      if string.match extension_regex
        extension = $2
        return extension
      end
      #
      # We already returned any recognizable extension.
      # However, we might still have extra junk to the right
      # of the phone number proper, so just chop it off.
      #
      idx = string.rindex(/[0-9]/)
      return nil if idx.nil?
      return nil if idx == (string.length - 1)      # at the end
      string.slice!((idx+1)..-1)                    # chop it
      return nil
    end

    public # instance methods

    def area_code_long
      "0" + area_code if area_code
    end

    # For many countries it's not apparent from the number
    # Will return false positives rather than false negatives.
    def is_mobile?
      country.is_mobile? "#{area_code}#{number}"
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
