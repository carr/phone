require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

## Bahamas
class BSTest < Phonie::TestCase

  def test_local
    parse_test('+12424611234', '1', '242', '4611234', 'Bahamas')
  end

  def test_mobile
    parse_test('+12424621234', '1', '242', '4621234', 'Bahamas')
  end
end
