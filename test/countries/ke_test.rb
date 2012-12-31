require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

## Kenya
class KETest < Phonie::TestCase
  def test_mobile
    parse_test('254724463323', '254', '72', '4463323', "Kenya", true)
  end

  def test_local
    parse_test('254624463323', '254', '62', '4463323', "Kenya", false)
  end
end
