require "helper"

class PhoneTest < Minitest::Test

  def test_number_without_country_code_initialize
    Phoner::Phone.default_country_code = nil

    assert_raises Phoner::CountryCodeError do
      pn = Phoner::Phone.new '5125486', '91'
    end
  end

  def test_number_without_country_and_area_code_initialize
    Phoner::Phone.default_country_code = nil
    Phoner::Phone.default_area_code = nil

    assert_raises Phoner::AreaCodeError do
      pn = Phoner::Phone.new '451588'
    end
  end

  def test_number_with_default_area_code_initialize
    Phoner::Phone.default_country_code = '385'
    Phoner::Phone.default_area_code = '47'

    pn = Phoner::Phone.new '451588'
    assert pn.number == '451588'
    assert pn.area_code == '47'
    assert pn.country_code == '385'
  end

  def test_number_with_default_country_code_initialize
    Phoner::Phone.default_country_code = '386'

    pn = Phoner::Phone.new '5125486', '91'
    assert pn.number == '5125486'
    assert pn.area_code == '91'
    assert pn.country_code == '386'
  end

  def test_number_with_country_code_initialize
    Phoner::Phone.default_country_code = '387'

    pn = Phoner::Phone.new '5125486', '91', '385'
    assert pn.number == '5125486'
    assert pn.area_code == '91'
    assert pn.country_code == '385'
  end

  def test_parse_empty
    assert_equal Phoner::Phone.parse(''), nil
    assert_equal Phoner::Phone.parse(nil), nil
  end

  def test_parse_with_special_characters_with_country
    pn = Phoner::Phone.parse "+1 545-545-5454"
    assert "1", pn.country_code
    assert "545", pn.area_code
    assert "5455454", pn.number
  end

  def test_parse_short_without_special_characters_without_country
    Phoner::Phone.default_country_code = nil

    assert_raises Phoner::CountryCodeError do
      pn = Phoner::Phone.parse "0915125486"
    end
  end

  def test_parse_short_with_special_characters_without_country
    Phoner::Phone.default_country_code = nil

    assert_raises Phoner::CountryCodeError do
      pn = Phoner::Phone.parse "091/512-5486"
    end
  end

  def test_to_s
    Phoner::Phone.default_country_code = nil
    pn = Phoner::Phone.new '5125486', '91', '385'
    assert pn.to_s == '+385915125486'
  end

  def test_to_s_without_country_code
    Phoner::Phone.default_country_code = '385'
    pn = Phoner::Phone.new '5125486', '91'
    assert pn.format("0%a%n") == '0915125486'
  end

  def test_format_special_with_country_code
    Phoner::Phone.default_country_code = nil
    pn = Phoner::Phone.new '5125486', '91', '385'
    assert pn.format("+ %c (%a) %n") == '+ 385 (91) 5125486'
  end

  def test_format_special_without_country_code
    Phoner::Phone.default_country_code = '385'
    pn = Phoner::Phone.new '5125486', '91'
    assert_equal pn.format("%A/%f-%l"), '091/512-5486'
  end

  def test_format_with_symbol_specifier
    Phoner::Phone.default_country_code = nil
    pn = Phoner::Phone.new '5125486', '91', '385'
    assert_equal pn.format(:europe), '+385 (0) 91 512 5486'
  end

  def test_validity
    assert true, Phoner::Phone.valid?("+17788827175")
  end

  def test_validity_with_country_code
    assert true, Phoner::Phone.valid?("7788827175", country_code: "1")
  end

  def test_doesnt_validate
    assert_equal Phoner::Phone.valid?('asdas'), false
    assert_equal Phoner::Phone.valid?('385915125486'), false
  end

  def test_comparison_true
    pn1 = Phoner::Phone.new '5125486', '91', '385'
    pn2 = Phoner::Phone.new '5125486', '91', '385'
    assert pn1 == pn2
  end

  def test_comparison_false
    pn1 = Phoner::Phone.new '5125486', '91', '385'
    pn2 = Phoner::Phone.new '1234567', '91', '385'
    assert pn1 != pn2
  end

  def test_find_by_country_isocode
    Phoner::Country.load
    assert_equal Phoner::Country.find_by_country_isocode('de').country_code, "49"
    assert_equal Phoner::Country.find_by_country_isocode('xx'), nil
    assert_equal Phoner::Country.find_by_country_isocode('bla'), nil
  end
end
