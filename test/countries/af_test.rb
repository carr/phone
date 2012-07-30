require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

## Afghanistan
class AFTest < Phoner::TestCase
  def test_local
    parse_test('+93201234567', '93', '20', '1234567', 'Afghanistan', false)
  end

  def test_mobile
    parse_test('+93712345678', '93', '7', '12345678', 'Afghanistan', true)
  end
end