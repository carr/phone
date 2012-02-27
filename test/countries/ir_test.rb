require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

## Iran
class IRTest < Phoner::TestCase
  def test_local
    parse_test('982188686344', '98', '21', '88686344')
    parse_test('985218868634', '98', '521', '8868634')
  end
end
