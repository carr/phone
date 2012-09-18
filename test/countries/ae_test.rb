require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

## UAE
class AETest < Phoner::TestCase
  def test_local
    parse_test('+97142063944',  '971', '4',  '2063944', 'United Arab Emirates', false)
    parse_test('+97122063944',  '971', '2',  '2063944', 'United Arab Emirates', false)
  end
  
  def test_mobile
    parse_test('+971502063944', '971', '50', '2063944', 'United Arab Emirates', true)
    parse_test('+971552063944', '971', '55', '2063944', 'United Arab Emirates', true)
  end

end
