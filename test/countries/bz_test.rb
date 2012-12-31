require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

## Belize
class BZTest < Phonie::TestCase
  def test_local
    parse_test('+5012123456', '501', "2", '123456', 'Belize', false)
  end

  def test_mobile
    parse_test('5016123456', '501', '6', '123456', 'Belize', true)
  end
end