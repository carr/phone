require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

## Argentina
class ARTest < Phoner::TestCase
  def test_local
    parse_test('+541112345678', '54', '11', '12345678', 'Argentina', false)
  end

  def test_mobile
    parse_test('+5498211534567', '54', '9821', '1534567', 'Argentina', true)
  end
end
