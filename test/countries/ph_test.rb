require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

## Philippines
class PHTest < Phoner::TestCase
  def test_local
    parse_test('639164285503', '63', '916', '4285503', "Philippines", true)
    parse_test('63364285503', '63', '36', '4285503', "Philippines", false)
  end
end
