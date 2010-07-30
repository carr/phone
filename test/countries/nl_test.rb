require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

## Netherlands
class NETest < Test::Unit::TestCase
  
  # 06:   mobile phone number
  def test_mobile
    parse_test('+31 6 12345678', '31', '6', '12345678')
  end
  
  # 066:  mobile pagers
  def test_pagers
    parse_test('+31 66 1234567', '31', '66', '1234567')
  end
  
  # 06760:  internet access number
  def test_internet_access
    parse_test('+31 6760 12345', '31', '6760', '12345')
  end
  
  # 0800: toll free number
  def test_toll_free
    parse_test('+31 800 123456', '31', '800', '123456')
  end
  
  # 084:  location independent (used mostly for fax-to-email and voicemail services)
  def test_location_independent_84
    parse_test('+31 84 1234567', '31', '84', '1234567')
  end
  
  # 085:  location independent
  def test_location_independent_85
    parse_test('+31 85 1234567', '31', '85', '1234567')
  end
  
  # 087:  location independent
  def test_location_independent_87
    parse_test('+31 87 1234567', '31', '87', '1234567')
  end
  
  # 088:  location independent (for companies)
  def test_location_independent_88
    parse_test('+31 88 1234567', '31', '88', '1234567')
  end
  
  # 0878: location independent (voice over IP)
  def test_location_independent_878
    parse_test('+31 878 123456', '31', '878', '123456')
  end
  
  # 0900: premium rate, information
  def test_premium_900
    parse_test('+31 900 123456', '31', '900', '123456')
  end
  
  # 0906: premium rate, erotic
  def test_premium_906
    parse_test('+31 906 123456', '31', '906', '123456')
  end
  # 0909: premium rate, entertainment
  
  # 112:  emergency services number
  # 14xxx(x): public authorities, where xxxx is the three- or four-digit area-code of the municipality
  # 18xx: number information
  
  # 01x(x) to 05x(x): geographical area codes
  
  ## two digit
  # 010 Rotterdam
  def test_rotterdam
    parse_test('+31 10 1234567', '31', '10', '1234567')
  end
  # 013 Tilburg
  def test_tilburg
    parse_test('+31 13 1234567', '31', '13', '1234567')
  end
  # 015 Delft
  
  # 020 Amsterdam
  def test_amsterdam
    parse_test('+31 20 1234567', '31', '20', '1234567')
  end
  # 023 Haarlem
  # 024 Nijmegen
  # 026 Arnhem
  
  # 030 Utrecht
  def test_utrecht
    parse_test('+31 30 1234567', '31', '30', '1234567')
  end
  # 033 Amersfoort
  def test_amersfoort
    parse_test('+31 33 1234567', '31', '33', '1234567')
  end
  # 035 Hilversum
  # 036 Almere
  # 038 Zwolle
  
  # 040 Eindhoven
  # 043 Maastricht
  # 045 Heerlen
  def test_heerlen
    parse_test('+31 45 1234567', '31', '45', '1234567')
  end
  # 046 Sittard
  
  # 050 Groningen
  def test_groningen
    parse_test('+31 50 1234567', '31', '50', '1234567')
  end
  # 053 Enschede
  # 055 Apeldoorn
  # 058 Leeuwarden
  def test_leeuwarden
    parse_test('+31 58 1234567', '31', '58', '1234567')
  end
  
  # 07x: geographical area codes (cities all over the country)
  # 070 The Hague
  def test_the_hague
    parse_test('+31 70 1234567', '31', '70', '1234567')
  end
  # 071 Leiden
  def test_leiden
    parse_test('+31 71 1234567', '31', '71', '1234567')
  end
  # 072 Alkmaar
  # 073 's-Hertogenbosch
  # 074 Hengelo
  # 075 Zaandam
  def test_zaandam
    parse_test('+31 75 1234567', '31', '75', '1234567')
  end
  # 076 Breda
  # 077 Venlo
  # 078 Dordrecht
  # 079 Zoetermeer
  def test_zoetermeer
    parse_test('+31 79 1234567', '31', '79', '1234567')
  end
  
  
  ## three digit
  # 0111 Zierikzee
  def test_zierikzee
    parse_test('+31 111 123456', '31', '111', '123456')
  end
  # 0113 Goes
  def test_goes
    parse_test('+31 113 123456', '31', '113', '123456')
  end
  # 0114 Hulst
  # 0115 Terneuzen
  # 0117 Sluis
  def test_sluis
    parse_test('+31 117 123456', '31', '117', '123456')
  end
  # 0118 Middelburg
  
  # 0161 Gilze-Rijen
  def test_gilze
    parse_test('+31 161 123456', '31', '161', '123456')
  end
  # 0162 Oosterhout
  # 0164 Bergen op Zoom
  def test_bergen
    parse_test('+31 164 123456', '31', '164', '123456')
  end
  # 0165 Roosendaal
  # 0166 Tholen
  # 0167 Steenbergen
  # 0168 Zevenbergen
  
  # 0172 Alphen aan den Rijn
  def test_alphen
    parse_test('+31 172 123456', '31', '172', '123456')
  end
  # 0174 Naaldwijk
  
  # 0180 Ridderkerk
  def test_ridderkerk
    parse_test('+31 180 123456', '31', '180', '123456')
  end
  # 0181 Spijkenisse
  # 0182 Gouda
  def test_gouda
    parse_test('+31 182 123456', '31', '182', '123456')
  end
  # 0183 Gorinchem
  # 0184 Sliedrecht
  # 0186 Oud-Beijerland
  # 0187 Middelharnis
  
  # 0222 Texel
  def test_texel
    parse_test('+31 222 123456', '31', '222', '123456')
  end
  # 0223 Den Helder
  # 0224 Schagen
  def test_shagen
    parse_test('+31 224 123456', '31', '224', '123456')
  end
  # 0226 Harenkarspel
  # 0227 Medemblik, Middenmeer as well as Heerhugowaard
  # 0228 Enkhuizen
  # 0229 Hoorn
  def test_hoorn
    parse_test('+31 229 123456', '31', '229', '123456')
  end
  
  # 0251 Beverwijk
  def test_beverwijk
    parse_test('+31 251 123456', '31', '251', '123456')
  end
  # 0252 Hillegom
  # 0255 IJmuiden
  
  # 0294 Weesp
  def test_weesp
    parse_test('+31 294 123456', '31', '294', '123456')
  end
  # 0297 Aalsmeer
  # 0299 Purmerend
  
  # 0313 Dieren
  def test_dieren
    parse_test('+31 313 123456', '31', '313', '123456')
  end
  # 0314 Doetinchem
  # 0315 Terborg
  def test_terborg
    parse_test('+31 315 123456', '31', '315', '123456')
  end
  # 0316 Zevenaar
  # 0317 Wageningen
  # 0318 Ede / Veenendaal
  
  # 0320 Lelystad
  def test_lelystad
    parse_test('+31 320 123456', '31', '320', '123456')
  end
  # 0321 Dronten
  
  # 0341 Harderwijk
  def test_harderwijk
    parse_test('+31 341 123456', '31', '341', '123456')
  end
  # 0342 Barneveld
  # 0343 Doorn
  # 0344 Tiel
  def test_tiel
    parse_test('+31 344 123456', '31', '344', '123456')
  end
  # 0345 Culemborg
  # 0346 Maarssen
  # 0347 Vianen
  # 0348 Woerden
  
  # 0411 Boxtel
  def test_boxtel
    parse_test('+31 411 123456', '31', '411', '123456')
  end
  # 0412 Oss
  # 0413 Veghel
  # 0416 Waalwijk
  # 0418 Zaltbommel
  
  # 0475 Roermond
  def test_roermond
    parse_test('+31 475 123456', '31', '475', '123456')
  end
  # 0478 Venray
  
  # 0481 Bemmel
  def test_bemmel
    parse_test('+31 481 123456', '31', '481', '123456')
  end
  # 0485 Cuijk
  # 0486 Grave
  # 0487 Druten
  def test_druten
    parse_test('+31 487 123456', '31', '487', '123456')
  end
  # 0488 Zetten
  
  # 0492 Helmond
  def test_helmond
    parse_test('+31 492 123456', '31', '492', '123456')
  end
  # 0493 Deurne
  # 0495 Weert
  def test_weert
    parse_test('+31 495 123456', '31', '495', '123456')
  end
  # 0497 Eersel
  # 0499 Best
  
  # 0511 Veenwouden
  def test_veenwouden
    parse_test('+31 511 123456', '31', '511', '123456')
  end
  # 0512 Drachten
  # 0513 Heerenveen
  # 0514 Balk
  # 0515 Sneek
  def test_sneek
    parse_test('+31 515 123456', '31', '515', '123456')
  end
  # 0516 Oosterwolde
  # 0517 Franeker
  # 0518 St. Annaparochie
  # 0519 Dokkum
  
  # 0521 Steenwijk
  def test_steenwijk
    parse_test('+31 521 123456', '31', '521', '123456')
  end
  # 0522 Meppel
  # 0523 Hardenberg
  # 0524 Coevorden
  def tst_coevorden
    parse_test('+31 524 123456', '31', '524', '123456')
  end
  # 0525 Elburg
  # 0527 Emmeloord
  # 0528 Hoogeveen
  # 0529 Ommen
  
  # 0541 Oldenzaal
  def test_oldenzaal
    parse_test('+31 541 123456', '31', '541', '123456')
  end
  # 0543 Winterswijk
  # 0544 Groenlo
  # 0545 Neede
  def test_neede
    parse_test('+31 545 123456', '31', '545', '123456')
  end
  # 0546 Almelo
  # 0547 Goor
  # 0548 Rijssen
  
  # 0561 Wolvega
  def test_wolvega
    parse_test('+31 561 123456', '31', '561', '123456')
  end
  # 0562 Terschelling/Vlieland
  # 0566 Irnsum
  
  # 0570 Deventer
  def test_deventer
    parse_test('+31 570 123456', '31', '570', '123456')
  end
  # 0571 Voorst
  # 0572 Raalte
  # 0573 Lochem
  def test_lochem
    parse_test('+31 573 123456', '31', '573', '123456')
  end
  # 0575 Zutphen
  # 0577 Uddel
  # 0578 Epe
  
  # 0591 Emmen
  def test_emmen
    parse_test('+31 591 123456', '31', '591', '123456')
  end
  # 0592 Assen
  # 0593 Beilen
  def test_beilen
    parse_test('+31 593 123456', '31', '593', '123456')
  end
  # 0594 Zuidhorn
  # 0595 Warffum
  # 0596 Appingedam
  # 0597 Winschoten
  # 0598 Hoogezand
  # 0599 Stadskanaal
  def test_stadskanaal
    parse_test('+31 599 123456', '31', '599', '123456')
  end
  
end
