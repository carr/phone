require "helper"

## Germany
class DETest < Minitest::Test
  def test_2_digits_area_code
    parse_test('+49 30 12345678', '49', '30', '12345678')
  end

  def test_3_digits_area_code
    parse_test('+49 714 9605832', '49', '714', '9605832')
  end

  def test_4_digits_area_code
    parse_test('+49 7141 9605832', '49', '7141', '9605832')
  end

  def test_5_digits_area_code
    parse_test('+49 35751 9605832', '49', '35751', '9605832')
  end

  def test_mobile
    parse_test('+49 162 3499558', '49', '162', '3499558')
  end

  def test_country_side
   parse_test('+49 (0)6120 59511-23', '49', '6120', '5951123')
  end

  def test_phone_number_with_9_digits
    parse_test('+49 30 123456789', '49', '30', '123456789')
  end

  def test_phone_number_with_10_digits
    parse_test('+49 30 1234567890', '49', '30', '1234567890')
  end

  def test_phone_number_with_11_digits
    parse_test('+49 30 12345678901', '49', '30', '12345678901')
  end
end
