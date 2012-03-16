require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

## Qatar
class QATest < Phoner::TestCase
  def test_local
    parse_test('97444123456', '974', '44', '123456', "Qatar", false)
    parse_test('97433123456', '974', '33', '123456', "Qatar", true)
  end
end
