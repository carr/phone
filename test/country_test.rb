require File.expand_path(File.dirname(__FILE__) + '/test_helper')

class CountryTest < Phoner::TestCase
  def test_find_by_country_name
    country = Phoner::Country.find_by_name('canada')
    assert_equal country.name, "Canada"

    country = Phoner::Country.find_by_name('Canada')
    assert_equal country.name, "Canada"
  end
end
