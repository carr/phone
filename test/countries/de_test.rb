require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

## Germany
class DETest < Test::Unit::TestCase

  def test_local
    parse_test('+49 714 1605832', '49', '714', '1605832')
  end
  
  def test_mobile
    parse_test('+49 162 3499558', '49', '162', '3499558')
  end  
  
  # TODO: germany has 2-5 length area codes, that's why this test doesn't go through
  #def test_country_side
  #  parse_test('+49 (0)6120 59511-23', '49', '6120', '5951123')
  #end  
  
end
