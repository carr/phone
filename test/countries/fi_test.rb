require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

## Finland
class FITest < Phoner::TestCase
  def test_local
    parse_test('+358181234567', '358', '18', '1234567', 'Finland', false)
  end

  def test_mobile
    parse_test('+358471234567', '358', '4', '71234567', 'Finland', true)
  end
end