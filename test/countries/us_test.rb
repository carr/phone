require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

## United States
class USTest < Test::Unit::TestCase
  
  def test_local
    parse_test('+1 555 123 4567', '1', '555', '1234567')
  end
  
  def test_tollfree
    parse_test('+1 800 555 3456', '1', '800', '5553456')
  end
  
  def test_long_with_default_country_code
    Phoner::Phone.default_country_code = '1'
    parse_test('2069735100', '1', '206', '9735100')
  end

  def test_short_with_default_country_code_and_area_code
    Phoner::Phone.default_country_code = '1'
    Phoner::Phone.default_area_code = '206'
    parse_test('9735100', '1', '206', '9735100')
  end  
end
