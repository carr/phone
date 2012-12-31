require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

## Costa Rica
class CRTest < Phonie::TestCase
  def test_local
    parse_test('+50621234567', '506', '2', '1234567', 'Costa Rica', false)
  end

  def test_mobile
    parse_test('50681234567', '506', '8', '1234567', 'Costa Rica', true)
  end
end
