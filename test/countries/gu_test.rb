require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

## Guam
class GRTest < Phonie::TestCase

  def test_local
    parse_test('+16711234567', '1', '671', '1234567', 'Guam')
  end
end
