require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

# 0x 5551 reserved for fictitious use. (not including x=3)
# 0x 7010 reserved for fictitious use.

## Australia
class AUTest < Test::Unit::TestCase
  
  # 00 Emergency and International access
  # 01 Alternate phone services
  # 014 Satellite phone services
  # 016 Paging [+3D or +6D]
  # 018 Analogue (AMPS) mobile phone - few numbers still in use [+6D]
  # 0198 Data networks [+2D or +6D] - e.g. 0198 379 000 is the Dial-Up POP number for iiNet
  
  # 02 Central East region (NSW, ACT)
  def test_central_east
    parse_test('+61 2 5551 1234', '61', '2', '55511234')
  end
  
  # 03 South-east region (VIC, TAS)
  def test_south_east
    parse_test('+61 3 5551 1234', '61', '3', '55511234')
  end
  
  # 04 Mobile services (Digital - GSM, CDMA, 3G)
  def test_mobile
    parse_test('+61 4 5551 1234', '61', '4', '55511234')
  end
  
  # 05 Universal/Personal numberings (uncommon)
  def test_personal
    parse_test('+61 5 5551 1234', '61', '5', '55511234')
  end
  
  # 07 North-east region (QLD)
  def test_north_east
    parse_test('+61 7 5551 1234', '61', '7', '55511234')
  end
  
  # 08 Central and West region (SA, NT, WA)
  def test_central
    parse_test('+61 8 5551 1234', '61', '8', '55511234')
  end
  
  # (Geographical region boundaries do not exactly follow state borders.)
  # 1 Non-geographic numbers
  
end
