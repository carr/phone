require File.expand_path(File.dirname(__FILE__) + '/test_helper')

class ExtensionTest < Test::Unit::TestCase

  def test_parse_usa_long_with_simple_extension
    pn = Phoner::Phone.parse "+1 2069735100 x143"

    assert_not_nil pn, %Q{parse should pass}
    assert_equal '9735100', pn.number
    assert_equal '206', pn.area_code
    assert_equal '1', pn.country_code
    assert_equal '143', pn.extension
  end

  def test_to_s_with_extension
    pn = Phoner::Phone.new '5125486', '91', '385', '143'
    assert_equal '+385915125486x143', pn.format(:default_with_extension)
  end

  def test_format_with_extension
    pn = Phoner::Phone.new '5125486', '91', '385', '143'
    assert_equal '(091)/512-5486 x 143', pn.format('(%A)/%f-%l x %x')
  end

end
