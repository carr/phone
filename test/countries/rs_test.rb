require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

## Serbia
class RSTest < Test::Unit::TestCase
  
  def test_local
    # Beograd
    parse_test('+381 11 24 33 836', '381', '11', '2433836')
  end
  
  
  def test_mobile
    # mts
    parse_test('+381 648542987', '381', '64', '8542987')
  end  
  
end
