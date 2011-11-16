require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

## Spain
# http://en.wikipedia.org/wiki/Telephone_numbers_in_Spain
# http://gospain.about.com/od/practicaltraveltips/f/area_codes.htm

# A problem is that landline area codes can be 2 (92) as well as 3 digits (923)
# right now the area_code_regexp is only finding 3 digit area_codes

class ESTest < Test::Unit::TestCase
  
  def test_validates
    Phoner::Phone.default_country_code = nil
    assert_equal Phoner::Phone.valid?("+34-695-097-612"), true
    assert_equal Phoner::Phone.valid?("0034 91-3597426"), true
    assert_equal Phoner::Phone.valid?("+0034 91-3597426"), true
    assert_equal Phoner::Phone.valid?("+34 92-6563629"), true
    assert_equal Phoner::Phone.valid?("(+34) 606 275 213"), true
    assert_equal Phoner::Phone.valid?("+034 937 299 016"), true
    assert_equal Phoner::Phone.valid?("+34 93 487 32 93"), true

    Phoner::Phone.default_country_code = '34'
    assert_equal Phoner::Phone.valid?(" 607 65 05 01 "), true
    assert_equal Phoner::Phone.valid?(" 971 15 66 33"), true
    assert_equal Phoner::Phone.valid?(" 93-4559934"), true
    assert_equal Phoner::Phone.valid?("628 274 908"), true
    assert_equal Phoner::Phone.valid?("744 486 62 78"), true
    assert_equal Phoner::Phone.valid?("916754559"), true
    assert_equal Phoner::Phone.valid?("93.4327119"), true
    assert_equal Phoner::Phone.valid?("986300257"), true
  end
  
end
