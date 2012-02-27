require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

## Egypt
class EGTest < Phoner::TestCase
  def test_local
    parse_test('20112345678', '20', '1', '12345678')
    parse_test('20931234567', '20', '93', '1234567')
  end
end
