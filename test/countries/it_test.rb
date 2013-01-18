require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

## Italy
class ITTest < Phonie::TestCase
  def test_local
    parse_test('+39 035 1234567',  '39', '035',  '1234567', 'Italy', false)
  end
  
  def test_mobile
    parse_test('+39 383 1234567', '39', '383', '1234567', 'Italy', true)
  end
end
