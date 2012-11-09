$:.unshift(File.dirname(__FILE__) + '/../lib')

require 'rubygems'

require 'test/unit'
require 'phone'

def parse_test(raw, country_code, area_code, number, country_name = nil, is_mobile = nil)
  pn = Phoner::Phone.parse(raw)

  assert_not_nil pn, %Q{parse should pass}
  assert_equal pn.country_code, country_code
  assert_equal pn.area_code, area_code
  assert_equal pn.number, number
  if country_name
    assert_equal pn.country.name, country_name
  end

  unless is_mobile.nil?
    assert_equal is_mobile, pn.is_mobile?
  end
end


class Phoner::TestCase < Test::Unit::TestCase

  def setup
    Phoner::Phone.default_country_code = nil
    Phoner::Phone.default_area_code = nil
  end

  def default_test
    klass = self.class.to_s
    ancestors = (self.class.ancestors - [self.class]).collect { |ancestor| ancestor.to_s }
    super unless klass =~ /TestCase/ or ancestors.first =~ /TestCase/
  end
end
