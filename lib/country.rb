module Phoner
  class Country < Struct.new(:name, :country_code, :char_2_code, :char_3_code, :area_code)
    cattr_accessor :all

    def self.load
      return @@all if @@all.present?

      data_file = File.join(File.dirname(__FILE__), '..', 'data', 'phone_countries.yml')

      @@all = {}
      YAML.load(File.read(data_file)).each_pair do |key, c|
        @@all[key] = Country.new(c[:name], c[:country_code], c[:char_2_code], c[:char_3_code], c[:area_code])
      end
      @@all
    end

    def to_s
      name
    end

    def self.find_by_country_code(code)
      @@all[code]
    end
    
    def self.find_by_country_isocode(isocode)
      if country = @@all.detect{|c|c[1].char_3_code.downcase == isocode}
        country[1]
      end
    end

    def country_code_regexp
      Regexp.new("^[+]#{country_code}")
    end
  end
  
end
