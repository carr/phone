require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

## Serbia
class RSTest < Phoner::TestCase

  def test_local
    # Beograd
    parse_test('+381 11 24 33 836', '381', '11', '2433836', "Serbia", false)
  end

  def test_mobile
    # mts
    parse_test('+381 648542987', '381', '64', '8542987', "Serbia", true)
  end
end
