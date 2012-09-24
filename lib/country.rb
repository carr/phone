module Phoner
  class Country < Struct.new(:name, :country_code, :char_2_code, :char_3_code, :area_code, :local_number_format, :mobile_format, :full_number_length, :number_format)
    cattr_accessor :all

    def self.load
      return @@all if @@all.present?

      data_file = File.join(File.dirname(__FILE__), '..', 'data', 'phone_countries.yml')

      @@all = []
      YAML.load(File.read(data_file)).each_pair do |key, c|
        next unless c[:area_code] && c[:local_number_format]
        @@all << Country.new(c[:name], c[:country_code], c[:char_2_code], c[:char_3_code], c[:area_code], c[:local_number_format], c[:mobile_format], c[:full_number_length], c[:number_format])
      end
      @@all
    end

    def to_s
      name
    end

    def self.find_all_by_phone_code(code)
      return [] if code.nil?
      @@all.select {|c| c.country_code == code }
    end

    def self.find_by_country_code(code)
      return nil if code.nil?
      @@all.each {|c| return c if c.char_3_code.downcase == code.downcase }
      nil
    end

    def self.find_by_name(name)
      return nil if name.nil?
      @@all.each {|c| return c if c.name.downcase == name.downcase }
      nil
    end

    # detect country from the string entered
    def self.detect(string, default_country_code, default_area_code)
      Country.find_all_by_phone_code(default_country_code).each do |country|
        return country if country.matches_local_number?(string, default_area_code)
      end

      # find if the number has a country code
      Country.all.each do |country|
        return country if country.matches_full_number?(string)
      end
      return nil
    end

    def is_mobile?(number)
      return true if mobile_format.nil?
      number =~ mobile_number_regex ? true : false
    end

    def matches_local_number?(string, default_area_code)
      ((string =~ full_number_regexp ||
       string =~ area_code_number_regexp) && string =~ number_format_regex) ||
      ((string =~ number_regex) && (default_area_code =~ area_code_regex))
    end

    def matches_full_number?(string)
      string =~ full_number_regexp && string =~ number_format_regex
    end

    def number_parts(number, default_area_code)
      number_part = if default_area_code
        number.match(number_regex)
        $1
      else
        nil
      end

      if number_part.nil?
        matches = number.match(area_code_number_regexp)
        area_part = $1
        number_part = matches.to_a.last
      end

      if number_part.nil?
        matches = number.match(full_number_regexp)
        country_part, area_part = $1, $2
        number_part = matches.to_a.last
      end

      area_part ||= default_area_code

      raise "Could not determine area code" if area_part.nil?
      raise "Could not determine number" if number_part.nil?

      {:number => number_part, :area_code => area_part, :country_code => country_code, :country => self}
    end

    private
    def number_format_regex
      Regexp.new("^[+0]?(#{country_code})?(#{number_format})$")
    end

    def full_number_regexp
      Regexp.new("^[+]?(#{country_code})(#{area_code})(#{local_number_format})$")
    end

    def area_code_number_regexp
      Regexp.new("^0?(#{area_code})(#{local_number_format})$")
    end

    def area_code_regex
      Regexp.new("^0?(#{area_code})$")
    end

    def mobile_number_regex
      Regexp.new("^0?(#{mobile_format})$")
    end

    def number_regex
      Regexp.new("^(#{local_number_format})$")
    end
  end
end
