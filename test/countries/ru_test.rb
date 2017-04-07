require "helper"

## Russia
class RUTest < Minitest::Test

  def test_local
    parse_test('89033891228', '7', '903', '3891228')
  end

  def test_local2
    parse_test('8 903 389-12-28', '7', '903', '3891228')
  end

  def test_local3
    parse_test('8(903)389-12-28', '7', '903', '3891228')
  end

  def test_local_city
    parse_test('8(8352)42-14-14', '7', '835', '2421414')
  end

  def test_international_city
    parse_test('+7(8352)42-14-14', '7', '835', '2421414')
  end

  def test_mobile
    parse_test('+7(903)389-12-28', '7', '903', '3891228')
  end

  def test_freecall
    phone = '8(800)111-11-11'

    parse_test(phone, '8', '800', '1111111')

    pn = Phoner::Phone.parse(phone)

    assert_equal '88001111111', pn.to_s
  end

end
