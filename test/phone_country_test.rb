require File.dirname(__FILE__) + '/test_helper'

class PhoneCountryTest < Test::Unit::TestCase
  def test_parse_germany_local
    pn = Phone.parse('+49 714 1605832')    

    assert_equal pn.country_code, '49'
    assert_equal pn.area_code, '714'
    assert_equal pn.number, '1605832'
  end
  
  def test_parse_germany_mobile
    pn = Phone.parse('+49 162 3499558')

    assert_equal pn.country_code, '49'
    assert_equal pn.area_code, '162'
    assert_equal pn.number, '3499558'
  end  
  
  def test_parse_hungary_mobile
    pn = Phone.parse('+36 30 5517999')    

    assert_equal pn.country_code, '36'
    assert_equal pn.area_code, '30'
    assert_equal pn.number, '5517999'
  end  
  
  def test_parse_slovenia_local
    #Maribor
    pn = Phone.parse '+ 386 2 23 46 611'
    
    assert_equal pn.country_code, '386'
    assert_equal pn.area_code, '2'
    assert_equal pn.number, '2346611'    
  end
  
  def test_parse_slovenia_local_2
    # Koper
    pn = Phone.parse '+ 386 5 23 46 611'
    
    assert_equal pn.country_code, '386'
    assert_equal pn.area_code, '5'
    assert_equal pn.number, '2346611'    
  end  
  
  def test_parse_slovenia_mobile
    # Mobitel
    pn = Phone.parse('+386 51 258999')    

    assert_equal pn.country_code, '386'
    assert_equal pn.area_code, '51'
    assert_equal pn.number, '258999'
  end
  
  def test_parse_serbia_local
    # Beograd
    pn = Phone.parse('+381 11 24 33 836')

    assert_equal pn.country_code, '381'
    assert_equal pn.area_code, '11'
    assert_equal pn.number, '2433836'
  end
  
  
  def test_parse_serbia_mobile
    # mts
    pn = Phone.parse('+381 648542987')

    assert_equal pn.country_code, '381'
    assert_equal pn.area_code, '64'
    assert_equal pn.number, '8542987'
  end  
  
  def test_parse_bosnia_local
    pn = Phone.parse '+387 33 25 02 33'
    
    assert_equal pn.country_code, '387'
    assert_equal pn.area_code, '33'
    assert_equal pn.number, '250233'    
  end

  def test_parse_south_africa_local
    # Telkom
    pn = Phone.parse('+27 11 555 5555')

    assert_equal pn.country_code, '27'
    assert_equal pn.area_code, '11'
    assert_equal pn.number, '5555555'
  end

  def test_parse_south_africa_mobile
    # Vodacom
    pn = Phone.parse('+27 82 555 5555')

    assert_equal pn.country_code, '27'
    assert_equal pn.area_code, '82'
    assert_equal pn.number, '5555555'
  end

  def test_parse_south_africa_tollfree
    # Telkom
    pn = Phone.parse('+27 800 123 321')

    assert_equal pn.country_code, '27'
    assert_equal pn.area_code, '800'
    assert_equal pn.number, '123321'
  end
  
  def test_parse_france_local
    pn = Phone.parse('+33 4 75 06 07 07')
    
    assert_equal pn.country_code, '33'
    assert_equal pn.area_code, '4'
    assert_equal pn.number, '75060707'
  end
  
  def test_parse_france_mobile
    pn = Phone.parse('+33 6 11 22 33 44')
    
    assert_equal pn.country_code, '33'
    assert_equal pn.area_code, '6'
    assert_equal pn.number, '11223344'
  end

  def test_parse_ukraine_local
    pn = Phone.parse('+380 57 711 22 33')
    
    assert_equal pn.country_code, '380'
    assert_equal pn.area_code, '57'
    assert_equal pn.number, '7112233'
  end
  
  def test_parse_ukraine_mobile
    pn = Phone.parse('+380-50-111-22-33')
    
    assert_equal pn.country_code, '380'
    assert_equal pn.area_code, '50'
    assert_equal pn.number, '1112233'
  end
end
