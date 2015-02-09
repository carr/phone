require "helper"

## Montenegro
class METest < Minitest::Test

  def test_mobile
    parse_test('+382 69 555 5555', '382', '69', '5555555')
  end

  def test_local
    parse_test('+382 20 555 5555', '382', '20', '5555555')
  end

end
