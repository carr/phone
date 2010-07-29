require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

## Germany
class DETest < Test::Unit::TestCase

  def test_local
    parse_test('+49 714 1605832', '49', '714', '1605832')
  end
  
  def test_mobile
    parse_test('+49 162 3499558', '49', '162', '3499558')
  end  
  
end
