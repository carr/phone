require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

## Norway
class NOTest < Phonie::TestCase
  def test_local
    parse_test('+4737123456', '47', "37", '123456', 'Norway', false)
  end

  def test_mobile
    parse_test('+4741234567', '47', '4', '1234567', 'Norway', true)
  end
end