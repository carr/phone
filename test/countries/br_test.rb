require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

## Brazil
class BRTest < Phonie::TestCase
  def test_local
    parse_test('+559112345678', '55', "91", '12345678', 'Brazil', false)
  end

  def test_mobile
    parse_test('551161234567', '55', '11', '61234567', 'Brazil', true)
  end
end