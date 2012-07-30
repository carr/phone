require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

## France
class FRTest < Phoner::TestCase

  def test_local
    parse_test('+33 4 75 06 07 07', '33', '4', '75060707', "France", false)
  end

  def test_mobile
    parse_test('+33 6 11 22 33 44', '33', '6', '11223344', "France", true)
  end

  def test_mobile_07
     parse_test('+33 7 11 22 33 44', '33', '7', '11223344', "France", true)
   end

  def test_voip
    parse_test('+33 9 11 22 33 44', '33', '9', '11223344', "France", false)
  end

end
