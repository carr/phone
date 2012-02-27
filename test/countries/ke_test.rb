require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

## Kenya
class KETest < Phoner::TestCase
  def test_local
    parse_test('254724463323', '254', '72', '4463323')
  end
end
