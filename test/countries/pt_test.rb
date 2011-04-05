require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

## Portugal
# source 1: http://pt.wikipedia.org/wiki/N%C3%BAmeros_de_telefone_em_Portugal
# source 2: http://www.anacom.pt/render.jsp?categoryId=279035

class PTTest < Test::Unit::TestCase
  
  ### Prefixes followed by corresponding tests
  
  ## 01-09: reserved for future use
  ## 1: Short Numbers
  
  ## 2: Landline / fixed numbers

  ## two digits landlines
  # 21:   Lisbon (Lisboa)
  def test_lisbon
    parse_test('+351 21 123 4567', '351', '21', '1234567')
  end
  # 22:   Oporto (Porto)
  def test_oporto
    parse_test('+351 22 123 4567', '351', '22', '1234567')
  end
  
  ## three digits landlines
  # 231:  Mealhada
  def test_mealhada
    parse_test('+351 231 123456', '351', '231', '123456')
  end
  
  # 232-295  (Viseu - Angra do Heroismo)
  def test_viseu
    parse_test('+351 232 123456', '351', '232', '123456')
  end
  def test_angra
    parse_test('+351 295 123456', '351', '295', '123456')
  end
  
  # 296: Ponta Delgada
  def test_pontadelgada
    parse_test('+351 296 123456', '351', '296', '123456')
  end
  
  ## 3: Nomad services
  ## 4: Not used
  ## 5: Free
  ## 6: Audiotext service, data network access...

  ## 7: Premium numbers ("Universal access numbers")  
  
  # 707-708: Premium Numbers
  def test_707
    Phoner::Phone.default_country_code = '351'
    parse_test('707 123 456', '351', '707', '123456')
  end
  
  ## 8: Free toll numbers
    
  # 800: Numero verde ("Green Number")
  def test_800
    Phoner::Phone.default_country_code = '351'
    parse_test('800 123 456', '351', '800', '123456')
  end
  # 808: Numero azul ("Blue Number")
  def test_808
    Phoner::Phone.default_country_code = '351'
    parse_test('808 123 456', '351', '808', '123456')
  end
  # 809: Custo partilhado ("Shared cost")
  def test_809
    Phoner::Phone.default_country_code = '351'
    parse_test('809 123 456', '351', '809', '123456')
  end
  
  ## 9: Mobile networks
  
  ## two-digits mobile networks
  # 91: Vodafone
  def test_vodafone
    parse_test('+351 91 1234567', '351', '91', '1234567')
  end
  # 93: Optimus
  def test_optimus
    parse_test('+351 93 1234567', '351', '93', '1234567')
  end
  # 96: TMN two-digits
  def test_tmn
    parse_test('+351 96 1234567', '351', '96', '1234567')
  end
  
  ## three-digits mobile networks
  # 921: TMN three-digits
  def test_tmn921
    parse_test('+351 921 123456', '351', '921', '123456')
  end
  # 923-926: TMN three-digits (corporate networks)
  def test_tmn923
    parse_test('+351 925 123456', '351', '925', '123456')
  end
  # 922: Phone-ix
  def test_phoneix
    parse_test('+351 922 123456', '351', '922', '123456')
  end
  # 929: Zon Mobile
  def test_zonmobile
    parse_test('+351 929 123456', '351', '929', '123456')
  end
  
  def test_validates
    Phoner::Phone.default_country_code = nil
    assert_equal Phoner::Phone.valid?('00351211234567'), true
    assert_equal Phoner::Phone.valid?('00351911234567'), true
    assert_equal Phoner::Phone.valid?('+351931234567'), true
    assert_equal Phoner::Phone.valid?('+351 (911) 123 456'), true
    assert_equal Phoner::Phone.valid?('+351921123456'), true

    Phoner::Phone.default_country_code = '351'
    assert_equal Phoner::Phone.valid?('(931) 234-567'), true
    assert_equal Phoner::Phone.valid?('(211) 234 567'), true
    assert_equal Phoner::Phone.valid?('232-123-456'), true
    assert_equal Phoner::Phone.valid?('232123456'), true
    assert_equal Phoner::Phone.valid?('92 212 34 56'), true
    assert_equal Phoner::Phone.valid?('221234567'), true
    assert_equal Phoner::Phone.valid?('708123456'), true
    assert_equal Phoner::Phone.valid?('800 123 456'), true
  end
  
end
