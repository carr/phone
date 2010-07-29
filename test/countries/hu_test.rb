require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

## Hungary
class HUTest < Test::Unit::TestCase
  
  def test_mobile
    parse_test('+36 30 5517999', '36', '30', '5517999')
  end  
  
end
