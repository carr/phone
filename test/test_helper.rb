$:.unshift(File.dirname(__FILE__) + '/../lib')

require 'rubygems'

require 'test/unit'
require 'phone'

def parse_test(raw, country_code, area_code, number)
  pn = Phoner::Phone.parse(raw)
  
  assert_not_nil pn, %Q{parse should pass}
  assert_equal pn.country_code, country_code
  assert_equal pn.area_code, area_code
  assert_equal pn.number, number
end