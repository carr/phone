# Enkapsulira jedan broj telefona za mreže u hrvatskoj i države koje imaju slične formate (slovenija, bosna..)
# 
# Sprema broj telefona podijeljen u 3 dijela
# * country_code - npr. '385', '386'
# * area_code - npr. '91', '47'
# * number - npr. '5125486', '451588'
# 
# brojevi se interno spremaju bez ikakvih dodatnih interpunkcija i tek pozivom metoda
# * to_s
# * format(arg)
# se formatiraju na određeni način
#
# Svi dijelovi su obavezni, ali se country code i area code mogu postaviti preko default_country_code i
# default_area_code
#
# Dependencies
# * koriste se neke .present? i slicne metode koje dodju sa ActiveSupport-om 
#
# TODO
# * manualni unos parse formata - recimo da zadajes
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
  
  # ako parsamo SHORT oblik onda ovo postavi kao country code 
  cattr_accessor :default_country_code
  # ako parsamo SHORT oblik onda ovo postavi kao area code 
  cattr_accessor :default_area_code  
  # duljina prvog dijela numbera kod ispisa
  cattr_accessor :n1_length
  # defaultna duljina prvog dijela numbera kod ispisa
  @@n1_length = 3
  
  # kreira novi broj telefona
  def initialize(*hash_or_args)    
    if hash_or_args.first.is_a?(Hash)
      hash = hash_or_args.first
      self.number = hash[:number]
      self.area_code = hash[:area_code] || self.default_area_code
      self.country_code = hash[:country_code] || self.default_country_code   
    else
      self.number = hash_or_args[0]
      self.area_code = hash_or_args[1] || self.default_area_code
      self.country_code = hash_or_args[2] || self.default_country_code      
    end
    
    raise "Must enter number" if self.number.blank?
    raise "Must enter area code or set default area code" if self.area_code.blank?
    raise "Must enter country code or set default country code" if self.country_code.blank?    
  end
  
  # kreira phone number objekt iz ulaznog stringa
  # format se automatski detektira iz stringa pomocu detect_format metode
  # string se normalizira metodom normalize  
  # kao rezultat vraca novi PhoneNumber objekt
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
  
  # da li je string sintaksno ispravan telefonski broj
  def self.valid?(string)
    parse(string).present?
  end
  
  # dijeli string na country_code, area_code i number
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
  
  # detektira u kojem od podržanih ulaznih formata je ovaj string
  def self.detect_format(string_with_number)
    formats = []
    FORMATS.each_pair do |format, regexp|
      formats << format if string_with_number =~ regexp
    end
    
    raise "Detected more than 1 format for #{string_with_number}" if formats.size > 1
    formats.first
  end
  
  # iz stringa briše sve znakovi koji nisu brojevi ili znak +
  def self.normalize(string_with_number)
    string_with_number.gsub /[^0-9+]/, ''
  end
  
  # ispisuje area code s vodecom nulom, dakle 091 kao 91
  def area_code_long
    "0" + area_code if area_code
  end
  
  # prvih n znamenki broja
  def number1
    number[0...self.class.n1_length]
  end
  
  # ono sto je ostalo nakon number1
  def number2
    n2_length = number.size - self.class.n1_length
    number[-n2_length, n2_length]
  end
  
  # formatira broj telefona u skladu sa zadanim formatom
  # * %c - country_code (385)
  # * %a - area_code (91)
  # * %A - area_code s vodecom nulom (091)
  # * %n - number (5125486)
  # * %n1 - prvih @@n1_length znamenki broja (konfigurabilno kroz PhoneNumber.n1_length), defaultno je 3, (512)
  # * %n2 - ostale znamenke broja (5486)
  def format(fmt)    
    fmt.gsub("%c", country_code || "").
           gsub("%a", area_code || "").
           gsub("%A", area_code_long || "").           
           gsub("%n", number || "").
           gsub("%f", number1 || "").
           gsub("%l", number2 || "")                      
  end
  
  # ispisuje broj telefona. defaultni format je "+%c%a%n"
  def to_s
    format("+%c%a%n")
  end
  
  # da li ovaj broj ima postavljen defaultni country_code
  def has_default_country_code?
    country_code == self.class.default_country_code
  end
  
  # da li ovaj broj ima postavljen defaultni area_code
  def has_default_area_code?
    area_code == self.class.default_area_code
  end
end
