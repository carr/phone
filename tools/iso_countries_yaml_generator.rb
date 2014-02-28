require 'yaml'
require 'carmen'

include Carmen

def country_hash(country_code, national_dialing_prefix, char_2_code, char_3_code, name, international_dialing_prefix)
  {
    country_code: country_code,
    national_dialing_prefix: national_dialing_prefix,
    char_2_code: char_2_code,
    char_3_code: char_3_code,
    name: name,
    international_dialing_prefix: international_dialing_prefix
  }
end

def new_iso_countries
  {
    "CA" => country_hash("1", "1", "CA", "CAN", "Canada", "11")
  }
end

data_file = File.expand_path(File.join('..', 'data', 'phone', 'countries.yml'), File.dirname(__FILE__))
iso_countries = {}
YAML.load(File.read(data_file)).each_pair do |key, c|
  country = Carmen::Country.coded(c[:char_3_code])
  if country
    c[:char_2_code] = country.alpha_2_code
    c[:char_3_code] = country.alpha_3_code
    iso_countries[c[:char_2_code]] = c
  end
  iso_countries.merge!(new_iso_countries)
end
target_file = File.expand_path(File.join('..', 'data', 'phone', 'iso_countries.yml'), File.dirname(__FILE__))
File.open(target_file, 'w'){ |f| f.write(iso_countries.to_yaml) }
