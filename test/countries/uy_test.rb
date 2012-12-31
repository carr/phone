require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

## Uruguay
# source: http://en.wikipedia.org/wiki/Telephone_numbers_in_Uruguay
class UYTest < Phonie::TestCase
  # 02 Montevideo
  def test_montevideo
    parse_test('+598 2 1234567', '598', '2', '1234567')
  end

  # 042 Maldonado
  def test_maldonado
    parse_test('+598 42 123456', '598', '42', '123456', "Uruguay", false)
  end

  # 09 Mobile phones
  def test_mobile_phones
    parse_test('+598 99 570110', '598', '99', '570110', "Uruguay", true)
  end
end
