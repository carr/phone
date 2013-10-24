require "helper"

## Hungary
class HUTest < Minitest::Test
  
  def test_mobile
    parse_test('+36 30 5517999', '36', '30', '5517999')
  end  
  
end
