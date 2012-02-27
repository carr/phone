require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

## Sri Lanka
class LKTest < Phoner::TestCase
  def test_local
    parse_test('94712345678', '94', '7', '12345678')
    parse_test('94651234567', '94', '65', '1234567')
  end
end
