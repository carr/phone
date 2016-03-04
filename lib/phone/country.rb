require "yaml"

module Phoner
  class Country < Struct.new(:name, :country_code, :char_2_code, :char_3_code, :area_code)
    module All
      attr_accessor :all
    end
    extend All

    def all
      self.class.all
    end

    def self.load
      return self.all if !self.all.nil? && !self.all.empty?

      data_file = File.join("..","..","data", "phone", "countries.yml")
      data_path = File.expand_path(data_file, File.dirname(__FILE__))

      self.all = {}
      YAML.load(File.read(data_path)).each_pair do |key, c|
        self.all[key] = Country.new(
          c[:name],
          c[:country_code],
          c[:char_2_code],
          c[:char_3_code],
          c[:area_code]
        )
      end
      self.process_german_area_codes
      self.all
    end

    def self.find_by_country_code(code)
      self.all[code]
    end

    def self.find_by_country_isocode(isocode)
      if country = self.all.detect{|c|c[1].char_3_code.downcase == isocode}
        country[1]
      end
    end

    def self.process_german_area_codes
      german_area_codes_file = File.join '..', '..', 'data', 'phone', 'german_area_codes.txt'
      german_area_codes_path = File.expand_path german_area_codes_file, File.dirname(__FILE__)
      german_area_codes = File.readlines german_area_codes_path
      german_area_codes.map! &:strip

      area_code = german_area_codes.join '|'
      area_code << '|' + self.all['49'].area_code

      self.all['49'].area_code = area_code
    end

    def to_s
      name
    end

    def country_code_regexp
      @country_code_regexp ||= Regexp.new("^[+]#{country_code}")
    end
  end
end
