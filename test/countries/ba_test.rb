require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

## Bosnia and Herzegovina
class BATest < Test::Unit::TestCase
  
  def test_local
    parse_test('+387 33 25 02 33', '387', '33', '250233')
  end
  
end
