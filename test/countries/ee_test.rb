require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

## Estonia
class EETest < Phonie::TestCase
  def test_local
    parse_test('+3722123456', '372', '2', '123456', 'Estonia', false)
  end

  def test_mobile
    parse_test('+37251234567', '372', '5', '1234567', 'Estonia', true)
  end
end