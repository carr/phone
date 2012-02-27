require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

## Nigeria
class NGTest < Phoner::TestCase
  def test_local
    parse_test('23434123456', '234', '34', '123456')
  end
end
