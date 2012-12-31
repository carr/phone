require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

## Guyana
class GYTest < Phonie::TestCase
  def test_local
    parse_test('5926674144', '592', '667', '4144', 'Guyana', true)
    parse_test('5922184144', '592', '218', '4144', 'Guyana', false)
  end
end
