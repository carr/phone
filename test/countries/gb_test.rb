require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

# http://stakeholders.ofcom.org.uk/telecoms/numbering/guidance-tele-no/numbers-for-drama
#
# Geographic Area     Geographic Area Code  Telephone Number Range 
# (1000 numbers in each range)
# Leeds               0113                  496 0000 to 496 0999
# Sheffield           0114                  496 0000 to 496 0999
# Nottingham          0115                  496 0000 to 496 0999
# Leicester           0116                  496 0000 to 496 0999
# Bristol             0117                  496 0000 to 496 0999
# Reading             0118                  496 0000 to 496 0999
# Birmingham          0121                  496 0000 to 496 0999
# Edinburgh           0131                  496 0000 to 496 0999
# Glasgow             0141                  496 0000 to 496 0999
# Liverpool           0151                  496 0000 to 496 0999
# Manchester          0161                  496 0000 to 496 0999
# London              020                   7946 0000 to 7946 0999
# Tyneside/Durham                           
#/Sunderland          0191                  498 0000 to 498 0999
# Northern Ireland    028                   9018 0000 to 9018 0999
# Cardiff             029                   2018 0000 to 2018 0999
# No area             01632                 960000 to 960999
#  
# Other Telephone Numbers
#  
# Telephone Number Type   Telephone Number Range 
# (1000 numbers in each range)
# Mobile                  07700 900000 to 900999
# Freephone               08081 570000 to 570999
# Premium Rate Services   0909 8790000 to 8790999
# UK Wide                 03069 990000 to 990999

class GBTest < Test::Unit::TestCase
  
  ## SHORT CODES
  # London              020                   7946 0000 to 7946 0999
  def test_london
    parse_test('+44 20 7946 0123', '44', '20', '79460123') 
  end
  
  # Northern Ireland    028                   9018 0000 to 9018 0999
  def test_northern_ireland
    parse_test('+44 28 9018 0123', '44', '28', '90180123')
  end
  
  # Cardiff             029                   2018 0000 to 2018 0999
  def test_cardiff
    parse_test('+44 29 2018 0123', '44', '29', '20180123')
  end

  # Leeds               0113                  496 0000 to 496 0999
  def test_leeds
    parse_test('+44 113 496 0123', '44', '113', '4960123')
  end

  # Sheffield           0114                  496 0000 to 496 0999
  def test_sheffield
    parse_test('+44 114 496 0123', '44', '114', '4960123')
  end
  
  # Nottingham          0115                  496 0000 to 496 0999
  def test_nottingham
    parse_test('+44 115 496 0123', '44', '115', '4960123')
  end
  
  # Leicester           0116                  496 0000 to 496 0999
  def test_leicester
    parse_test('+44 116 496 0123', '44', '116', '4960123')
  end
  
  # Bristol             0117                  496 0000 to 496 0999
  def test_bristol
    parse_test('+44 117 496 0123', '44', '117', '4960123')
  end
  
  # Reading             0118                  496 0000 to 496 0999
  def test_reading
    parse_test('+44 118 496 0123', '44', '118', '4960123')
  end
  
  # Birmingham          0121                  496 0000 to 496 0999
  def test_birmingham
    parse_test('+44 121 496 0123', '44', '121', '4960123')
  end
  
  # Edinburgh           0131                  496 0000 to 496 0999
  def test_edinburgh
    parse_test('+44 131 496 0123', '44', '131', '4960123')
  end
  
  # Glasgow             0141                  496 0000 to 496 0999
  def test_glasgow
    parse_test('+44 141 496 0123', '44', '141', '4960123')
  end
  
  # Liverpool           0151                  496 0000 to 496 0999
  def test_liverpool
    parse_test('+44 151 496 0123', '44', '151', '4960123')
  end
  
  # Manchester          0161                  496 0000 to 496 0999
  def test_manchester
    parse_test('+44 161 496 0123', '44', '161', '4960123')
  end
  
  # Tyneside/Durham                           
  #/Sunderland          0191                  498 0000 to 498 0999
  def test_tyneside
    parse_test('+44 191 496 0123', '44', '191', '4960123')
  end
  
  ## LONG CODES
  
  # 01202 — Bournemouth (BO)
  def test_bournemouth
    parse_test('+44 1202 96 0123', '44', '1202', '960123')
  end
  
  # 01326 — Falmouth (FA)
  def test_falmouth
    parse_test('+44 1326 96 0123', '44', '1326', '960123')
  end
  
  # 01420 — Alton (HA)
  def test_alton
    parse_test('+44 1420 96 0123', '44', '1420', '960123')
  end
  
  # 01598 — Lynton (LY)
  def test_lynton
    parse_test('+44 1598 96 0123', '44', '1598', '960123')
  end
  
  # 01637 — Newquay (NE)
  def test_newquay
    parse_test('+44 1637 96 0123', '44', '1637', '960123')
  end
  
  # 01700 — Rothesay (RO)
  def test_rothesay
    parse_test('+44 1700 96 0123', '44', '1700', '960123')
  end
  
  # 01951 — Colonsay
  def test_colonsay
    parse_test('+44 1951 96 0123', '44', '1951', '960123')
  end
  
  # No area             01632                 960000 to 960999
  def test_no_area
    parse_test('+44 1632 96 0123', '44', '1632', '960123')
  end
  
  # Personal numbering  070 xxxx xxxx
  def test_personal_numbering
    parse_test('+44 70 00001234', '44', '70', '00001234')
  end
  
  # Mobile                  07700 900000 to 900999
  def test_mobile
    parse_test('+44 7700 900345', '44', '7700', '900345')
  end
  
  def test_mobile_2
    parse_test('+44 7778 900345', '44', '7778', '900345')
  end
  
  # Freephone               08081 570000 to 570999
  def test_freephone
    parse_test('+44 808 1570123', '44', '808', '1570123')
  end
  
  def test_freephone_2
    parse_test('+44 873 1570123', '44', '873', '1570123')
  end
  
  # Premium Rate Services   0909 8790000 to 8790999
  def test_premium
    parse_test('+44 909 8790999', '44', '909', '8790999')
  end
  
  def test_premium2
    parse_test('+44 910 8790123', '44', '910', '8790123')
  end
  
  # UK Wide                 03069 990000 to 990999
  def test_wide
    parse_test('+44 306 9990123', '44', '306', '9990123')
  end
  
  def test_wide_2
    parse_test('+44 339 9990123', '44', '339', '9990123')
  end
  
end
