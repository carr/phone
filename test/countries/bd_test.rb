require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

## Bangladesh
class BDTest < Phoner::TestCase
  def test_local
    parse_test('+8801715379982', '880', '171', '5379982')
    parse_test('+8801191573647', '880', '119', '1573647')
  end
end
