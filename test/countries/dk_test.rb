require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

## Denmark
class DKTest < Phoner::TestCase
  def test_local_or_mobile
    parse_test('+4512345678', '45', '12', '345678', 'Denmark', true)
  end
end