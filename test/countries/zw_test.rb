require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

## Zimbabwe
class ZWTest < Phoner::TestCase
  def test_local
    parse_test('+263454168409', '263', '4', '54168409', "Zimbabwe", false)
  end

  def test_mobile
    parse_test('263774168409', '263', '77', '4168409', "Zimbabwe", true)
  end
end
