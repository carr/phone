require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

## Saudi Arabia
class SATest < Phoner::TestCase
  def test_local
    parse_test('96651234567', '966', '5', '1234567')
  end
end
