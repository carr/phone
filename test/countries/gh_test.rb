require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

## Ghana
class GHTest < Phonie::TestCase
  def test_local
    parse_test('233-24-3156555', '233', '24', '3156555', 'Ghana', true)
    parse_test('233-34-3156555', '233', '34', '3156555', 'Ghana', false)
  end
end
