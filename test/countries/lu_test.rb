require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

## Luxembourg 
class LUTest < Phonie::TestCase
  def test_local
    parse_test('+352 2422 1234', '352', '2422', '1234', "Luxembourg", false)
  end
  
  def test_mobile
   parse_test('+352 671 123456', '352', '671', '123456', "Luxembourg", true) 
  end
end
