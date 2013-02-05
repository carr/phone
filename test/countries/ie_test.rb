require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

# 0x 5551 reserved for fictitious use. (not including x=3)
# 0x 7010 reserved for fictitious use.

## Ireland
class IETest < Test::Unit::TestCase

  def test_short_cork_number
    parse_test('+353 28 28946', '353', '28', '28946')
  end

  def test_short_cork_number_2
    parse_test('+353 28 28943', '353', '28', '28943')
  end

  def test_short_cork_number_3
    pp Phoner::Phone.split_to_parts '2828946', :country_code => '353'
    pn = Phoner::Phone.parse '+353 28 28943'
    pp pn

    pp Phoner::Phone.new ({:number=>"28946", :area_code=>"28", :country_code=>"353"})
  end
end
