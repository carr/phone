require "helper"

## Uruguay
# source: http://en.wikipedia.org/wiki/Telephone_numbers_in_Uruguay
class UYTest < Minitest::Test

  # 02 Montevideo
  def test_montevideo
    parse_test('+598 2 1234567', '598', '2', '1234567')
  end

  # 042 Maldonado
  def test_maldonado
    parse_test('+598 42 123456', '598', '42', '123456')
  end

  # 09 Mobile phones
  def test_mobile_phones
    parse_test('+598 99 570110', '598', '99', '570110')
  end

end
