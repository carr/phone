require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

## Greece
class GRTest < Phoner::TestCase

  def test_local
    parse_test('+302112345678', '30', '21', '12345678', 'Canada')
  end
end
