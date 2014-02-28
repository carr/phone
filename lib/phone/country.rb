module Phoner
  class Country < Struct.new(:name, :country_code, :char_2_code, :char_3_code, :area_code)
    cattr_accessor :all

    def self.load
      return @@all if @@all.present?

      data_file = File.expand_path(File.join('..','..','data', 'phone', 'iso_countries.yml'), File.dirname(__FILE__))

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
      self.load unless @@all.present?
      @@all.values.detect{ |c| c.country_code == code }
    end

    def self.find_all_by_country_code(code)
      # Canada and US have the same country_code
      self.load unless @@all.present?
      @@all.values.select{ |c| c.country_code == code }
    end

    def self.find_by_country_isocode(isocode)
      self.load unless @@all.present?
      # before, char_3_code was actually the 2 character ISO code, and
      # the hash key was the phone country code
      @@all[isocode.upcase]
    end

    def self.by_iso_2_char(isocode)
      self.find_by_country_isocode(isocode)
    end

    def self.by_iso_3_char(isocode)
      self.load unless @@all.present?
      @@all.values.detect{ |c| c.char_3_code.downcase == isocode.downcase }
    end

    def country_code_regexp
      @country_code_regexp ||= Regexp.new("^[+]#{country_code}")
    end
  end

end
