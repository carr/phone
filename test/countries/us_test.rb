require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

## United States
class USTest < Phoner::TestCase

  def test_local
    parse_test('+1 251 123 4567', '1', '251', '1234567', 'United States')
  end

  def test_tollfree
    parse_test('+1 800 555 3456', '1', '800', '5553456', 'United States')
  end

  def test_long_with_default_country_code
    Phoner::Phone.default_country_code = '1'
    parse_test('2069735100', '1', '206', '9735100', 'United States')
  end

  def test_short_with_default_country_code_and_area_code
    Phoner::Phone.default_country_code = '1'
    Phoner::Phone.default_area_code = '206'
    parse_test('9735100', '1', '206', '9735100', 'United States')
  end
end
