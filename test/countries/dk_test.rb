require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

## Denmark
class DKTest < Phoner::TestCase
  def test_local
    parse_test('+4512345678', '45', "12", '345678', 'Denmark', false)
  end

  def test_mobile
    parse_test('+4540123456', '45', '40', '123456', 'Denmark', true)
  end
end