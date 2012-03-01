require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

## Pakistan
class PKTest < Phoner::TestCase
  def test_local
    parse_test('92627414433', '92', '62', '7414433', "Pakistan", false)
    parse_test('923627414433', '92', '362', '7414433', "Pakistan", true)
  end
end
