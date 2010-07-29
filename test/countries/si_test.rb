require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

## Slovenia
class SITest < Test::Unit::TestCase
  
  def test_local
    #Maribor
    parse_test('+ 386 2 23 46 611', '386', '2', '2346611')
  end
  
  def test_local_2
    # Koper
    parse_test('+ 386 5 23 46 611', '386', '5', '2346611')
  end  
  
  def test_mobile
    # Mobitel
    parse_test('+386 51 258999', '386', '51', '258999')
  end
  
end
