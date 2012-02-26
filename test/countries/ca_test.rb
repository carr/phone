require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

## Canada
class CATest < Phoner::TestCase

  def test_local
    parse_test('+1 416 856 3348', '1', '416', '8563348', 'Canada')
  end

  def test_long_with_default_country_code
    Phoner::Phone.default_country_code = '1'
    parse_test('9059735100', '1', '905', '9735100', 'Canada')
  end

  def test_short_with_default_country_code_and_area_code
    Phoner::Phone.default_country_code = '1'
    Phoner::Phone.default_area_code = '416'
    parse_test('9735100', '1', '416', '9735100', 'Canada')
  end
end
