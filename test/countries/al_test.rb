require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

## Albania
class ALTest < Phonie::TestCase
  def test_local
    parse_test('+35541234567', '355', '4', '1234567', 'Albania', false)
  end

  def test_mobile
    parse_test('+355612345678', '355', '6', '12345678', 'Albania', true)
  end
end
