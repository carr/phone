require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

## Czech Republic
class CZTest < Phoner::TestCase
  def test_local
    parse_test('+420381234567', '420', '38', '1234567', 'Czech Republic', false)
  end

  def test_mobile
    parse_test('+420712345678', '420', '7', '12345678', 'Czech Republic', true)
  end
end