require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

## Belarus
class BYTest < Phoner::TestCase
  def test_local
    parse_test('+375225123456', '375', '225', '123456', 'Belarus', false)
  end

  def test_mobile
    parse_test('+375291234567', '375', '29', '1234567', 'Belarus', true)
  end
end