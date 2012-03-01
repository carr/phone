require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

## India
class INTest < Phoner::TestCase
  def test_local
    parse_test('+91.124.4529000', '91', '124', '4529000')
    parse_test('+91 124 4529000', '91', '124', '4529000')
    parse_test('+911244529000', '91', '124', '4529000')
    parse_test('911244529000', '91', '124', '4529000', "India", false)
  end

  def test_mobile
    parse_test('918124452900', '91', '8124', '452900', "India", true)
  end

  def test_long_with_default_country_code
    Phoner::Phone.default_country_code = '91'
    parse_test('91244529000', '91', '9124', '4529000')
  end

  def test_short_with_default_country_code_and_area_code
    Phoner::Phone.default_country_code = '91'
    Phoner::Phone.default_area_code = '9124'
    parse_test('4529000', '91', '9124', '4529000')
  end
end
