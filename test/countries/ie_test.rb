require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

## Ireland
class IETest < Phonie::TestCase
  def test_local
    parse_test('+3535041234',  '353', '504',  '1234', 'Ireland', false)
  end
  
  def test_mobile
    parse_test('+353821234567', '353', '82', '1234567', 'Ireland', true)
  end
end 
