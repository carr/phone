require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

## Hungary
class HUTest < Phonie::TestCase
  def test_mobile
    parse_test('+36 30 5517999', '36', '30', '5517999', "Hungary", true)
  end

  def test_capital
    parse_test('+36 1 5517999', '36', '1', '5517999', "Hungary", false)
  end
end
