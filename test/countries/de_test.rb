require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

## Germany
class DETest < Phoner::TestCase

  def test_local
    parse_test('+49 714 1605832', '49', '714', '1605832', "Germany", false)
  end

  def test_mobile
    parse_test('+49 162 3499558', '49', '162', '3499558', "Germany", true)
  end

  def test_country_side
    parse_test('+49 (0)6120 59511-23', '49', '6120', '5951123', "Germany", false)
  end

end
