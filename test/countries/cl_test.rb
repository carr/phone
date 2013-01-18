require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

## Chile
class CLTest < Phonie::TestCase

  def test_local
    parse_test('+56 2 12345678', '56', '2', '12345678', 'Chile', false)
  end

  def test_mobile
    parse_test('+56 9 12345678', '56', '9', '12345678', 'Chile', true)
  end

  def test_other_cities
     parse_test('+56 32 1234567', '56', '32', '1234567', 'Chile', false)
   end

  def test_voip
    parse_test('+56 44 1234567', '56', '44', '1234567', 'Chile', false)
  end

end
