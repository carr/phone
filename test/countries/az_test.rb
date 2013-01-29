require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

## Azerbaijan
class AZTest < Phonie::TestCase
  def test_local
    parse_test('+994221234567',  '994', '22',  '1234567', 'Azerbaijan', false)
  end
  
  def test_mobile
    parse_test('+994401234567', '994', '40', '1234567', 'Azerbaijan', true)
  end
end 
