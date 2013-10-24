require "rubygems"

begin
  require "bundler"
rescue LoadError => e
  STDERR.puts e.message
  STDERR.puts "Run `gem install bundler` to install Bundler."
  exit e.status_code
end

begin
  Bundler.setup(:default, :development, :test)
rescue Bundler::BundlerError => e
  STDERR.puts e.message
  STDERR.puts "Run `bundle install` to install missing gems."
  exit e.status_code
end

require "phone"
require "minitest/autorun"

def parse_test(raw, country_code, area_code, number)
  pn = Phoner::Phone.parse(raw)

  refute_nil pn, %Q{parse should pass}
  assert_equal pn.country_code, country_code
  assert_equal pn.area_code, area_code
  assert_equal pn.number, number
end
