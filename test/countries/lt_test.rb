require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

## Lithuania
class LTTest < Phonie::TestCase
  def test_local
    parse_test('+37042512345',  '370', '425',  '12345', 'Lithuania', false)
  end
  
  def test_mobile
    parse_test('+37062512345', '370', '625', '12345', 'Lithuania', true)
  end
end
