module Phoner
  class Country < Struct.new(:name, :country_code, :char_2_code, :area_code, :number_format)
    cattr_accessor :all

    def self.load
      return @@all if @@all.present?

      data_file = File.join(File.dirname(__FILE__), '..', 'data', 'phone_countries.yml')

      @@all = []
      YAML.load(File.read(data_file)).each_pair do |key, c|
        next unless c[:area_code] && c[:number_format]
        @@all << Country.new(c[:name], c[:country_code], c[:char_2_code], c[:area_code], c[:number_format])
      end
      @@all
    end

    def to_s
      name
    end

    def self.find_all_by_country_code(code)
      @@all.select {|c| c.country_code == code }
    end

    def self.find_by_name(name)
      @@all.each {|c| return c if c.name.downcase == name }
      nil
    end

    # detect country from the string entered
    def self.detect(string, default_country_code, default_area_code)
      Country.find_all_by_country_code(default_country_code).each do |country|
        return country if string =~ country.full_number_regexp ||
                          string =~ country.area_code_number_regexp ||
                          ((string =~ country.number_regex) && (default_area_code =~ country.area_code_regex))
      end

      # find if the number has a country code
      Country.all.each do |country|
        return country if string =~ country.full_number_regexp
      end
      return nil
    end

    def country_code_regexp
      Regexp.new("^[+]?#{country_code}")
    end

    def full_number_regexp
      Regexp.new("^[+]?(#{country_code})(#{area_code})(#{number_format})$")
    end

    def area_code_number_regexp
      Regexp.new("^0?(#{area_code})(#{number_format})$")
    end

    def area_code_regex
      Regexp.new("^0?(#{area_code})$")
    end

    def number_regex
      Regexp.new("^(#{number_format})$")
    end

    def number_parts(number, default_area_code)
      number_part = if default_area_code
        number.match(number_regex)
        $1
      else
        nil
      end

      if number_part.nil?
        number.match(area_code_number_regexp)
        area_part = $1
        number_part = $2
      end

      if number_part.nil?
        number.match(full_number_regexp)
        country_part, area_part, number_part = $1, $2, $3
      end

      area_part ||= default_area_code

      raise "Could not determine area code" if area_part.nil?
      raise "Could not determine number" if number_part.nil?

      {:number => number_part, :area_code => area_part, :country_code => country_code, :country => self}
    end
  end

end
