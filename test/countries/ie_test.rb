require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

# 0x 5551 reserved for fictitious use. (not including x=3)
# 0x 7010 reserved for fictitious use.

## Ireland
class IETest < Test::Unit::TestCase

  def test_short_cork_number_1
    parse_test('+353 028 28946', '353', '028', '28946')
  end

  def test_short_cork_number_1
    parse_test('+353 028 28943', '353', '028', '28943')
  end
end
