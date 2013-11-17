require "helper"

## New Zealand
class NZTest < Minitest::Test
  def test_local
    parse_test('+6431234567',  '64', '3',  '1234567')
  end
end
