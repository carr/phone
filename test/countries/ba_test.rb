require "helper"

## Bosnia and Herzegovina
class BATest < Minitest::Test

  def test_local
    parse_test('+387 33 25 02 33', '387', '33', '250233')
  end

end
