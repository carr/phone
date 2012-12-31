require File.expand_path(File.dirname(__FILE__) + '/test_helper')

class CountryTest < Phonie::TestCase
  def test_find_by_country_name
    country = Phonie::Country.find_by_name('canada')
    assert_equal country.name, "Canada"

    country = Phonie::Country.find_by_name('Canada')
    assert_equal country.name, "Canada"

    assert_nil  Phonie::Country.find_by_name(nil)
    assert_nil  Phonie::Country.find_by_country_code(nil)
    assert_equal [],  Phonie::Country.find_all_by_phone_code(nil)
  end
end
