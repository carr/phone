require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

## Bosnia and Herzegovina
class BATest < Phoner::TestCase
  def test_local
    parse_test('+387 33 25 02 33', '387', '33', '250233', "Bosnia and Herzegovina", false)
    parse_test('+387 61 25 02 33', '387', '6', '1250233', "Bosnia and Herzegovina", true)
  end
end
