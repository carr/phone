require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

## Bolivia
class BOTest < Phonie::TestCase
  def test_local
    parse_test('+59131234567', '591', "3", '1234567', 'Bolivia', false)
  end

  def test_mobile
    parse_test('+59171234567', '591', '7', '1234567', 'Bolivia', true)
  end
end