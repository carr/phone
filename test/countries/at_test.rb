require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

## Austria
# Austrian numbers are, ugh, strange. The matching patterns used are minimal :/
# and will result in many false positives
class ATTest < Phonie::TestCase
  def test_local
    parse_test('+4354321', '43', "5432", '1', 'Austria', false)
  end

  def test_mobile
    parse_test('+43612345678', '43', '6', '12345678', 'Austria', true)
  end
end