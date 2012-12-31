require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

## Algeria
class DZTest < Phonie::TestCase
  def test_local
    parse_test('+21329123456', '213', "29", '123456', 'Algeria', false)
  end

  def test_mobile
    parse_test('+213551234567', '213', '55', '1234567', 'Algeria', true)
  end
end