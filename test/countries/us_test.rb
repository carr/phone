require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

## United States
class USTest < Test::Unit::TestCase
  
  def test_local
    parse_test('+1 555 123 4567', '1', '555', '1234567')
  end
  
  def test_tollfree
    parse_test('+1 800 555 3456', '1', '800', '5553456')
  end
  
end
