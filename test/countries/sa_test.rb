require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

## Saudi Arabia
class SATest < Phoner::TestCase
  def test_local
    parse_test('96641234567', '966', '4', '1234567', "Saudi Arabia", false)
    parse_test('966512345678', '966', '5', '12345678', "Saudi Arabia", true)
  end
end
