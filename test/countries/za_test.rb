require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

## South Africa
class ZATest < Phonie::TestCase
  def test_local
    # Telkom
    parse_test('+27 11 555 5555', '27', '11', '5555555', "South Africa", false)
  end

  def test_mobile
    # Vodacom
    parse_test('+27 82 555 5555', '27', '82', '5555555', "South Africa", true)
  end

  def test_tollfree
    # Telkom
    parse_test('+27 800 123 321', '27', '800', '123321', "South Africa", false)
  end
end
