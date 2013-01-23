require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

## Armenia
class AMTest < Phonie::TestCase
  def test_local
    parse_test('+37422212345',  '374', '222',  '12345', 'Armenia', false)
  end
  
  def test_mobile
    parse_test('+37451234567', '374', '5', '1234567', 'Armenia', true)
  end
end 
