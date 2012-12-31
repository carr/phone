require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

## Bhutan
class BTTest < Phonie::TestCase
  def test_local
    parse_test('9757220768', '975', '7', '220768', "Bhutan", false)
    parse_test('+97517610328', '975', '17', '610328', "Bhutan", true)
  end
end
