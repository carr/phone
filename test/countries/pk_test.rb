require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

## Pakistan
class PKTest < Phoner::TestCase
  def test_local
    parse_test('92627414433', '92', '62', '7414433')
  end
end
