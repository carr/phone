require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

## Bulgaria
class BGTest < Phonie::TestCase
  def test_local
    parse_test('+35921234567', '359', "2", '1234567', 'Bulgaria', false)
  end

  def test_mobile
    parse_test('359871234567', '359', '87', '1234567', 'Bulgaria', true)
    parse_test('35943123456', '359', '43', '123456', 'Bulgaria', true)
  end
end