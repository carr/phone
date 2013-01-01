require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

## Latvia
class LVTest < Phonie::TestCase
  def test_local
    parse_test('+37164123456',  '371', '64',  '123456', 'Latvia', false)
  end
  
  def test_mobile
    parse_test('+37129123456', '371', '29', '123456', 'Latvia', true)
  end
end
