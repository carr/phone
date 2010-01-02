# An object representing a phone number for Croatia and countries with similar formats (slovenia, bosnia..)
# 
# The phone number is recorded in 3 separate parts:
# * country_code - e.g. '385', '386'
# * area_code - e.g. '91', '47'
# * number - e.g. '5125486', '451588'
#
# All parts are mandatoriy, but country code and area code can be set for all phone numbers using
#   PhoneNumber.default_country_code
#   PhoneNumber.default_area_code
#
# Dependencies
# * ActiveSupport (present?, cattr_accessor)
#
# TODO
# * manually entering parse format, using regexps for different parts:
#   :area_code => regexp, :country_code => regexp itd...problem je s "+" karakterom ili "00" recimo
class PhoneNumber   
  FORMATS = {
    # 00385915125486, 0038513668734
    :long_with_zeros => /^(00)([1-9]{1}[0-9]{2})([1]|[2-9][0-9])([0-9]+)$/,
    # +385915125486, +38513668734
    :long => /^([+])([1-9]{1}[0-9]{2})([1]|[2-9][0-9])([0-9]+)$/,
    # 047451588, 013668734
    :short => /^0([1]|[2-9][0-9])([0-9]+)$/,
    # 451588
    :really_short => /^([^0][0-9]{1,7})$/
  }
  
  attr_accessor :country_code, :area_code, :number
  
  cattr_accessor :default_country_code
  cattr_accessor :default_area_code  
  
  # length of first number part (using multi number format)
  cattr_accessor :n1_length
  # default length of first number part
  @@n1_length = 3
  
  def initialize(*hash_or_args)    
    if hash_or_args.first.is_a?(Hash)
      hash_or_args = hash_or_args.first
      keys = {:number => :number, :area_code => :area_code, :country_code => :country_code}
    else
      keys = {:number => 0, :area_code => 1, :country_code => 2}
    end
    
    self.number = hash_or_args[ keys[:number] ]
    self.area_code = hash_or_args[ keys[:area_code] ] || self.default_area_code
    self.country_code = hash_or_args[ keys[:country_code] ] || self.default_country_code      

    raise "Must enter number" if self.number.blank?
    raise "Must enter area code or set default area code" if self.area_code.blank?
    raise "Must enter country code or set default country code" if self.country_code.blank?    
  end
  
  # create a new phone number by parsing a string
  # the format of the string is detect automatically (from FORMATS)
  def self.parse(string, options={})
    options[:country_code] ||= self.default_country_code
    options[:country_code] ||= self.default_area_code   
    
    if string.present?    
      string = normalize(string)
      
      parts = split_to_parts(string, options)
      if parts
        pn = PhoneNumber.new(parts)
      end
    end
  end
  
  # is this string a valid phone number?
  def self.valid?(string)
    parse(string).present?
  end
  
  # split string into hash with keys :country_code, :area_code and :number
  def self.split_to_parts(string, options = {})
    format = detect_format(string)    
    return nil if format.nil?    

    parts = string.match FORMATS[format]

    case format
      when :long
        {:number => parts[4], :area_code => parts[3], :country_code => parts[2]}
      when :long_with_zeros
        {:number => parts[4], :area_code => parts[3], :country_code => parts[2]}        
      when :short
        {:number => parts[2], :area_code => parts[1], :country_code => options[:country_code]}            
      when :really_short
        {:number => parts[1], :area_code => options[:area_code], :country_code => options[:country_code]}                      
    end    
  end
  
  # detect format (from FORMATS) of input string
  def self.detect_format(string_with_number)
    formats = []
    FORMATS.each_pair do |format, regexp|
      formats << format if string_with_number =~ regexp
    end
    
    raise "Detected more than 1 format for #{string_with_number}" if formats.size > 1
    formats.first
  end
  
  # fix string so it's easier to parse, remove extra characters etc.
  def self.normalize(string_with_number)
    string_with_number.gsub /[^0-9+]/, ''
  end
  
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
  
  # format phone number
  # %c - country_code (385)
  # %a - area_code (91)
  # %A - area_code with leading zero (091)
  # %n - number (5125486)
  # %n1 - first @@n1_length characters of number (configured through PhoneNumber.n1_length), default is 3 (512)
  # %n2 - last characters of number (5486)
  def format(fmt)    
    fmt.gsub("%c", country_code || "").
           gsub("%a", area_code || "").
           gsub("%A", area_code_long || "").           
           gsub("%n", number || "").
           gsub("%f", number1 || "").
           gsub("%l", number2 || "")                      
  end
  
  # the default format is "+%c%a%n"
  def to_s
    format("+%c%a%n")
  end
  
  # does this number belong to the default country code?
  def has_default_country_code?
    country_code == self.class.default_country_code
  end
  
  # does this number belong to the default area code?
  def has_default_area_code?
    area_code == self.class.default_area_code
  end
end
