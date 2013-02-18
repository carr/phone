require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

## New Zealand
class NZTest < Phonie::TestCase
  def test_local
    parse_test('+6431234567',  '64', '3',  '1234567', 'New Zealand', false)
  end
  
  def test_mobile
    parse_test('+6421234567', '64', '2', '1234567', 'New Zealand', true)
    parse_test('+642123456789', '64', '2', '123456789', 'New Zealand', true)
  end
end 
