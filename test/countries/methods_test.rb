require "helper"

class MethodsTest < Minitest::Test

  def test_find_by_country_isocode
    assert_equal Phoner::Country.find_by_country_isocode('de').country_code, "49"
    assert_equal Phoner::Country.find_by_country_isocode('xx'), nil
    assert_equal Phoner::Country.find_by_country_isocode('bla'), nil
  end

  def test_find_by_country_code
    assert_equal Phoner::Country.find_by_country_code('1').country_code, "1"
    assert_equal Phoner::Country.find_by_country_code('999'), nil
  end

  def test_find_all_by_country_code
    assert_equal Phoner::Country.find_all_by_country_code('1').size, 2
    assert_equal Phoner::Country.find_all_by_country_code('43').size, 1
  end

  def test_country_by_iso_2_char
    assert_equal Phoner::Country.by_iso_2_char("CA").name, "Canada"
    assert_equal Phoner::Country.by_iso_2_char("BL"), nil
  end

  def test_country_by_iso_3_char
    assert_equal Phoner::Country.by_iso_3_char("CAN").name, "Canada"
    assert_equal Phoner::Country.by_iso_3_char("BLA"), nil
  end

end
