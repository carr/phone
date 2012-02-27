require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

## Guyana
class GYTest < Phoner::TestCase
  def test_local
    parse_test('5926674144', '592', '667', '4144')
  end
end
