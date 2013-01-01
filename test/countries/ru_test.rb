require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

## Russia
class RUTest < Phonie::TestCase
  def test_local
    parse_test('+74845612345',  '7', '48456',  '12345', 'Russian Federation', false)
  end
  
  def test_mobile
    parse_test('+79123456789', '7', '9', '123456789', 'Russian Federation', true)
  end
end
