require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

## Georgia
class GETest < Phoner::TestCase
  def test_local
    parse_test('+995368123456', '995', "368", '123456', 'Georgia', false)
  end

  def test_mobile
    parse_test('+995512345678', '995', '51', '2345678', 'Georgia', true)
  end
end
