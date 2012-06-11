require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

## Ecuador
class ECTest < Phoner::TestCase
  def test_local
    parse_test('+59321234567', '593', '2', '1234567', 'Ecuador', false)
  end

  def test_mobile
    parse_test('+59391234567', '593', '9', '1234567', 'Ecuador', true)
  end
end