require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

## Egypt
class EGTest < Phonie::TestCase
  def test_local
    parse_test('20931234567', '20', '93', '1234567', 'Egypt', false)
    parse_test('201016244087', '20', '1', '016244087', 'Egypt', true)
  end
end
