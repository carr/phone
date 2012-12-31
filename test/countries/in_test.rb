require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

## India
class INTest < Phonie::TestCase
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
    Phonie::Phone.default_country_code = '91'
    parse_test('9124459000', '91', '9124', '459000')
  end

  def test_short_with_default_country_code_and_area_code
    Phonie::Phone.default_country_code = '91'
    Phonie::Phone.default_area_code = '9124'
    parse_test('4529000', '91', '9124', '4529000')
  end

  def test_lengths
    Phonie::Phone.default_country_code = '91'

    phone = Phonie::Phone.parse("919812344")
    assert_nil phone

    phone = Phonie::Phone.parse("9818147874")
    assert phone

    phone = Phonie::Phone.parse("91111111111")
    assert_nil phone

    phone = Phonie::Phone.parse("98111111111")
    assert_nil phone

    phone = Phonie::Phone.parse("98111111119")
    assert_nil phone
  end
end
