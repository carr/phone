require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

## Sweden
class SETest < Test::Unit::TestCase

  # 08  Greater Stockholm
  def test_stockholm
    parse_test('+4685555555', '46', '8', '5555555')
  end
  
  ## two digit codes
  
  # 010 Geographically Independent Numbers / VOIP services
  def test_independent_numbers
    parse_test('+46105555555', '46', '10', '5555555')
  end
  
  # 011 Norrköping
  def test_norrkoping
    parse_test('+46115555555', '46', '11', '5555555')
  end
  
  # 013 Linköping
  def test_linkoping
    parse_test('+46135555555', '46', '13', '5555555')
  end
  
  # 016 Eskilstuna-Torshälla
  def test_eskilstuna
    parse_test('+46165555555', '46', '16', '5555555')
  end
  
  # 018 Uppsala
  def test_uppsala
    parse_test('+46185555555', '46', '18', '5555555')
  end
  
  # 019 Örebro-Kumla
  def test_orebro
    parse_test('+46195555555', '46', '19', '5555555')
  end
  
  # 020 toll-free
  def test_toll_free
    parse_test('+46205555555', '46', '20', '5555555')
  end
  
  # 021 Västerås
  def test_vasteras
    parse_test('+46215555555', '46', '21', '5555555')
  end
  
  # 023 Falun
  def test_falun
    parse_test('+46235555555', '46', '23', '5555555')
  end
  
  # 026 Gävle-Sandviken
  def test_gavle
    parse_test('+46265555555', '46', '26', '5555555')
  end
  
  # 031 Göteborg
  def test_goteborg
    parse_test('+46315555555', '46', '31', '5555555')
  end
  
  # 033 Borås
  def test_boras
    parse_test('+46335555555', '46', '33', '5555555')
  end
  
  # 035 Halmstad
  def test_halmstad
    parse_test('+46355555555', '46', '35', '5555555')
  end
  
  # 036 Jönköping-Huskvarna
  def test_jonkoping
    parse_test('+46365555555', '46', '36', '5555555')
  end
  
  # 040 Malmö
  def test_malmo
    parse_test('+46405555555', '46', '40', '5555555')
  end
  
  # 042 Helsingborg-Höganäs
  def test_helsingborg
    parse_test('+46425555555', '46', '42', '5555555')
  end
  
  # 044 Kristianstad
  def test_kristianstad
    parse_test('+46445555555', '46', '44', '5555555')
  end
  
  # 046 Lund
  def test_lund
    parse_test('+46465555555', '46', '46', '5555555')
  end
  
  # 054 Karlstad
  def test_karlstad
    parse_test('+46545555555', '46', '54', '5555555')
  end
  
  # 060 Sundsvall-Timrå
  def test_sundsvall
    parse_test('+46605555555', '46', '60', '5555555')
  end
  
  # 063 Östersund
  def test_ostersund
    parse_test('+46635555555', '46', '63', '5555555')
  end
  
  # 070, 
  def test_mobile_70
    parse_test('+46705555555', '46', '70', '5555555')
  end

  # 071 Telematics in Mobile Networks (used to be Premium rate numbers)
  def test_telematics
    parse_test('+46715555555', '46', '71', '5555555')
  end
    
  # 072, 
  def test_mobile_72
    parse_test('+46725555555', '46', '72', '5555555')
  end
  
  # 073, 
  def test_mobile_73
    parse_test('+46735555555', '46', '73', '5555555')
  end
  
  # 076  Mobile networks
  def test_mobile_76
    parse_test('+46765555555', '46', '76', '5555555')
  end
  
  # 090 Umeå
  def test_umea
    parse_test('+46905555555', '46', '90', '5555555')
  end
  
  # 099 Premium rate calls
  def test_premium_99
    parse_test('+46995555555', '46', '99', '5555555')
  end

  ## three digit codes
  
  # 0120  Åtvidaberg
  def test_atvidaberg
    parse_test('+46120555555', '46', '120', '555555')
  end
  # 0121  Söderköping
  # 0122  Finspång
  # 0123  Valdemarsvik
  # 0125  Vikbolandet
  # 0140  Tranås
  # 0141  Motala
  # 0142  Mjölby-Skänninge-Boxholm
  # 0143  Vadstena
  # 0144  Ödeshög
  # 0150  Katrineholm
  # 0151  Vingåker
  # 0152  Strängnäs
  # 0155  Nyköping-Oxelösund
  # 0156  Trosa-Vagnhärad
  # 0157  Flen-Malmköping
  # 0158  Gnesta
  # 0159  Mariefred
  # 0171  Enköping
  def test_enkoping
    parse_test('+461715555555', '46', '171', '5555555')
  end
  # 0173  Öregrund-Östhammar
  # 0174  Alunda
  # 0175  Hallstavik-Rimbo
  # 0176  Norrtälje
  
  # 0220  Hallstahammar-Surahammar
  def test_hallstahammar
    parse_test('+462205555555', '46', '220', '5555555')
  end
  # 0221  Köping
  # 0222  Skinnskatteberg
  # 0223  Fagersta-Norberg
  # 0224  Sala-Heby
  # 0225  Hedemora-Säter
  # 0226  Avesta-Krylbo
  # 0227  Kungsör
  # 0240  Ludvika-Smedjebacken
  # 0241  Gagnef-Floda
  # 0243  Borlänge
  # 0246  Svärdsjö-Enviken
  # 0247  Leksand-Insjön
  # 0248  Rättvik
  def test_rattvik
    parse_test('+462485555555', '46', '248', '5555555')
  end
  # 0250  Mora-Orsa
  # 0251  Älvdalen
  # 0253  Idre-Särna
  # 0258  Furudal
  # 0270  Söderhamn
  # 0271  Alfta-Edsbyn
  # 0278  Bollnäs
  # 0280  Malung
  # 0281  Vansbro
  # 0290  Hofors-Storvik
  # 0291  Hedesunda-Österfärnebo
  # 0292  Tärnsjö-Östervåla
  # 0293  Tierp-Söderfors
  # 0294  Karlholmsbruk-Skärplinge
  # 0295  Örbyhus-Dannemora
  # 0297  Ockelbo-Hamrånge
  def test_ockelbo
    parse_test('+462975555555', '46', '297', '5555555')
  end
  
  # 0300  Kungsbacka
  def test_kungsbacka
    parse_test('+463005555555', '46', '300', '5555555')
  end
  # 0301  Hindås
  # 0302  Lerum
  # 0303  Kungälv
  # 0304  Orust-Tjörn
  # 0320  Kinna
  # 0321  Ulricehamn
  # 0322  Alingsås-Vårgårda
  # 0325  Svenljunga-Tranemo
  # 0340  Varberg
  def test_varberg
    parse_test('+463405555555', '46', '340', '5555555')
  end
  # 0345  Hyltebruk-Torup
  # 0346  Falkenberg
  # 0370  Värnamo
  # 0371  Gislaved-Anderstorp
  # 0372  Ljungby
  # 0380  Nässjö
  # 0381  Eksjö
  # 0382  Sävsjö
  # 0383  Vetlanda
  # 0390  Gränna
  # 0392  Mullsjö
  # 0393  Vaggeryd
  
  # 0410  Trelleborg
  def test_trelleborg
    parse_test('+464105555555', '46', '410', '5555555')
  end
  # 0411  Ystad
  # 0413  Eslöv-Höör
  # 0414  Simrishamn
  # 0415  Hörby
  # 0416  Sjöbo
  # 0417  Tomelilla
  # 0418  Landskrona-Svalöv
  # 0430  Laholm
  def test_lanholm
    parse_test('+464305555555', '46', '430', '5555555')
  end
  # 0431  Ängelholm-Båstad
  # 0433  Markaryd-Strömsnäsbruk
  # 0435  Klippan-Perstorp
  # 0451  Hässleholm
  # 0454  Karlshamn-Olofström
  # 0455  Karlskrona
  # 0456  Sölvesborg-Bromölla
  # 0457  Ronneby
  # 0459  Ryd
  # 0470  Växjö
  def test_vaxjo
    parse_test('+464705555555', '46', '470', '5555555')
  end
  # 0471  Emmaboda
  # 0472  Alvesta-Rydaholm
  # 0474  Åseda-Lenhovda
  # 0476  Älmhult
  # 0477  Tingsryd
  # 0478  Lessebo
  # 0479  Osby
  # 0480  Kalmar
  # 0481  Nybro
  # 0485  Öland
  # 0486  Torsås
  # 0490  Västervik
  # 0491  Oskarshamn-Högsby
  # 0492  Vimmerby
  # 0493  Gamleby
  # 0494  Kisa
  def test_kisa
    parse_test('+464945555555', '46', '494', '5555555')
  end
  # 0495  Hultsfred-Virserum
  # 0496  Mariannelund
  # 0498  Gotland
  # 0499  Mönsterås
  
  # 0500  Skövde
  def test_skovde
    parse_test('+465005555555', '46', '500', '5555555')
  end
  # 0501  Mariestad
  # 0502  Tidaholm
  # 0503  Hjo
  def test_hjo
    parse_test('+465035555555', '46', '503', '5555555')
  end
  # 0504  Tibro
  # 0505  Karlsborg
  # 0506  Töreboda-Hova
  # 0510  Lidköping
  # 0511  Skara-Götene
  # 0512  Vara-Nossebro
  # 0513  Herrljunga
  # 0514  Grästorp
  # 0515  Falköping
  # 0520  Trollhättan
  # 0521  Vänersborg
  # 0522  Uddevalla
  # 0523  Lysekil
  # 0524  Munkedal
  # 0525  Grebbestad
  # 0526  Strömstad
  # 0528  Färgelanda
  # 0530  Mellerud
  # 0531  Bengtsfors
  # 0532  Åmål
  # 0533  Säffle
  # 0534  Ed
  # 0550  Kristinehamn
  # 0551  Gullspång
  # 0552  Deje
  def test_deje
    parse_test('+465525555555', '46', '552', '5555555')
  end
  # 0553  Molkom
  # 0554  Kil
  # 0555  Grums
  # 0560  Torsby
  # 0563  Hagfors-Munkfors
  # 0564  Sysslebäck
  # 0565  Sunne
  # 0570  Arvika
  # 0571  Charlottenberg-Åmotfors
  # 0573  Årjäng
  # 0580  Kopparberg
  # 0581  Lindesberg
  # 0582  Hallsberg-Pålsboda
  # 0583  Askersund
  # 0584  Laxå
  # 0585  Fjugesta-Svartå
  # 0586  Karlskoga-Degerfors
  # 0587  Nora
  def test_nora
    parse_test('+465875555555', '46', '587', '5555555')
  end
  # 0589  Arboga
  # 0590  Filipstad
  # 0591  Hällefors-Grythyttan
  
  # 0611  Härnösand
  def test_harnosand
    parse_test('+466115555555', '46', '611', '5555555')
  end
  # 0612  Kramfors
  # 0613  Ullånger
  # 0620  Sollefteå
  # 0621  Junsele
  # 0622  Näsåker
  # 0623  Ramsele
  # 0624  Backe
  # 0640  Krokom
  # 0642  Lit
  # 0643  Hallen-Oviken
  # 0644  Hammerdal
  # 0645  Föllinge
  # 0647  Åre-Järpen
  # 0650  Hudiksvall
  # 0651  Ljusdal
  # 0652  Bergsjö
  # 0653  Delsbo
  # 0657  Los
  # 0660  Örnsköldsvik
  # 0661  Bredbyn
  # 0662  Björna
  # 0663  Husum
  def test_husum
    parse_test('+466635555555', '46', '663', '5555555')
  end
  # 0670  Strömsund
  # 0671  Hoting
  # 0672  Gäddede
  # 0680  Sveg
  # 0682  Rätan
  # 0684  Hede-Funäsdalen
  # 0687  Svenstavik
  # 0690  Ånge
  # 0691  Torpshammar
  # 0692  Liden
  # 0693  Bräcke-Gällö
  # 0695  Stugun
  # 0696  Hammarstrand
  
  # 07x(x)  various non-geographical area codes
  # ambiguous!
  
  # 074(x)  Pagers
  def test_pagers
    parse_test('+467405555555', '46', '740', '5555555')
  end
  
  # 0900  Premium rate calls
  def test_premium_900
    parse_test('+469005555555', '46', '900', '5555555')
  end
  # 0910  Skellefteå
  # 0911  Piteå
  # 0912  Byske
  # 0913  Lövånger
  # 0914  Burträsk
  # 0915  Bastuträsk
  # 0916  Jörn
  def test_jorn
    parse_test('+469165555555', '46', '916', '5555555')
  end
  # 0918  Norsjö
  # 0920  Luleå
  # 0921  Boden
  # 0922  Haparanda
  # 0923  Kalix
  # 0924  Råneå
  # 0925  Lakaträsk
  # 0926  Överkalix
  # 0927  Övertorneå
  # 0928  Harads
  # 0929  Älvsbyn
  # 0930  Nordmaling
  # 0932  Bjurholm
  # 0933  Vindeln
  # 0934  Robertsfors
  # 0935  Vännäs
  def test_vannas
    parse_test('+469355555555', '46', '935', '5555555')
  end
  # 0939  Premium rate calls 
  # 0940  Vilhelmina
  # 0941  Åsele
  # 0942  Dorotea
  # 0943  Fredrika
  # 0944  Premium rate calls
  # 0950  Lycksele
  # 0951  Storuman
  # 0952  Sorsele
  # 0953  Malå
  # 0954  Tärnaby
  # 0960  Arvidsjaur
  # 0961  Arjeplog
  # 0970  Gällivare
  # 0971  Jokkmokk
  # 0973  Porjus
  # 0975  Hakkas
  # 0976  Vuollerim
  # 0977  Korpilombolo
  # 0978  Pajala
  # 0980  Kiruna
  # 0981  Vittangi
  def test_vittangi
    parse_test('+469815555555', '46', '981', '5555555')
  end
end
