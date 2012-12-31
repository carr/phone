require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

## Israel
class ILTest < Phonie::TestCase
  def test_local
    parse_test('+97241234567', '972', '4', '1234567', "Israel", false)
  end

  def test_mobile
    parse_test('972541234567', '972', '54', '1234567', "Israel", true)
  end
end
