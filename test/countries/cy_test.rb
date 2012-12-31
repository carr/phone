require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

## Cyprus
class CYTest < Phonie::TestCase
  def test_local
    parse_test('+35723123456', '357', '23', '123456', 'Cyprus', false)
  end

  def test_mobile
    parse_test('+35799123456', '357', '99', '123456', 'Cyprus', true)
  end
end