require "helper"

## South Africa
class ZATest < Minitest::Test

  def test_local
    # Telkom
    parse_test('+27 11 555 5555', '27', '11', '5555555')
  end

  def test_mobile
    # Vodacom
    parse_test('+27 82 555 5555', '27', '82', '5555555')

    # Broader cellular ranges past initial allocation given to telecoms service providers
    parse_test('+27 62 555 5555', '27', '62', '5555555')
  end

  def test_tollfree
    # Telkom
    parse_test('+27 800 123 321', '27', '800', '123321')
  end

end
