require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

## El Salvador 
class SVTest < Phonie::TestCase
  def test_local
    parse_test('+50321234567', '503', '2', '1234567', 'El Salvador', false)
  end

  def test_mobile
    parse_test('+50371234567', '503', '7', '1234567', 'El Salvador', true)
  end
end