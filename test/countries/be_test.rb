require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

## Belgium
class BETest < Test::Unit::TestCase
  
  ## single digit
  # 02:   Brussels (Bruxelles/Brussel)
  def test_brussels
    parse_test('+32 2 1234567', '32', '2', '1234567')
  end
  # 03:   Antwerpen (Antwerp), Sint-Niklaas
  def test_antwerpen
    parse_test('+32 3 1234567', '32', '3', '1234567')
  end
  # 04:   Liège (Luik), Voeren (Fourons)
  def test_liege
    parse_test('+32 4 1234567', '32', '4', '1234567')
  end
  # 09:   Gent (Ghent/Gand)
  def test_gent
    parse_test('+32 9 1234567', '32', '9', '1234567')
  end
  
  ## two digit
  # 010:  Wavre (Waver)
  def test_wavre
    parse_test('+32 10 123456', '32', '10', '123456')
  end
  # 011:  Hasselt
  def test_hasselt
    parse_test('+32 11 123456', '32', '11', '123456')
  end
  # 012:  Tongeren (Tongres)
  def test_tongeren
    parse_test('+32 12 123456', '32', '12', '123456')
  end
  # 013:  Diest
  def test_diest
    parse_test('+32 13 123456', '32', '13', '123456')
  end
  # 014:  Herentals, Turnhout
  # 015:  Mechelen (Malines)
  # 016:  Leuven (Louvain), Tienen (Tirlemont)
  # 019:  Waremme (Borgworm)
  def test_waremme
    parse_test('+32 19 123456', '32', '19', '123456')
  end
  
  # 050:  Brugge (Bruges), Zeebrugge
  def test_brugge
    parse_test('+32 50 123456', '32', '50', '123456')
  end
  # 051:  Roeselare (Roulers)
  def test_roeselare
    parse_test('+32 51 123456', '32', '51', '123456')
  end
  # 052:  Dendermonde (Termonde)
  # 053:  Aalst (Alost)
  # 054:  Ninove
  # 055:  Ronse (Renaix)
  # 056:  Kortrijk (Courtrai), Comines-Warneton, Mouscron (Moeskroen)
  # 057:  Ieper (Ypres)
  # 058:  Veurne (Furnes)
  # 059:  Oostende (Ostend)
  def test_oostende
    parse_test('+32 59 123456', '32', '59', '123456')
  end
  
  # 060:  Chimay
  def test_chimay
    parse_test('+32 60 123456', '32', '60', '123456')
  end
  # 061:  Bastogne, Libramont-Chevigny
  # 063:  Arlon (Aarlen)
  # 064:  La Louviere
  # 065:  Mons (Bergen)
  # 067:  Nivelles (Nijvel)
  def test_nivelles
    parse_test('+32 67 123456', '32', '67', '123456')
  end
  # 068:  Ath (Aat)
  # 069:  Tournai (Doornik)
  
  # 070:  Specialty Numbers (i.e. bus information or bank information)
  def test_specialty
    parse_test('+32 70 123456', '32', '70', '123456')
  end
  # 071:  Charleroi
  
  # 081:  Namur (Namen)
  def test_namur
    parse_test('+32 81 123456', '32', '81', '123456')
  end
  # 082:  Dinant
  # 083:  Ciney
  # 084:  Jemelle, Marche-en-Famenne
  # 085:  Huy
  # 086:  Durbuy
  # 087:  Verviers
  # 089:  Genk

  # 0800: toll free service
  def test_toll_free
    parse_test('+32 800 12345', '32', '800', '12345')
  end
  
  # 090x: Premium numbers (0900, 0901, 0902, 0903, 0904, 0905, 0906, 0907, 0908, 0909)
  def test_premium_900
    parse_test('+32 900 12345', '32', '900', '12345')
  end
  
  def test_premium_901
    parse_test('+32 901 12345', '32', '901', '12345')
  end
  
end
