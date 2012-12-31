require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

## Guatemala
class GTTest < Phonie::TestCase
  def test_local
    parse_test('+50212345678', '502', "1", '2345678', 'Guatemala', false)
  end

  def test_mobile
    parse_test('+50242345678', '502', '4', '2345678', 'Guatemala', true)
  end
end
