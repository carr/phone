require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

## Ukraine
class UATest < Phoner::TestCase

  def test_local
    parse_test('+380 57 711 22 33', '380', '57', '7112233', "Ukraine", false)
  end

  def test_mobile
    parse_test('+380-50-111-22-33', '380', '50', '1112233', "Ukraine", true)
  end

  def test_mobile2
    parse_test('+380-66-042-22-01', '380', '66', '0422201', "Ukraine", true)
  end
end
