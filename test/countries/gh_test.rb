require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

## Ghana
class GHTest < Phoner::TestCase
  def test_local
    parse_test('233-24-3156555', '233', '24', '3156555')
  end
end
