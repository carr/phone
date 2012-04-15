require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

class ETTest < Phoner::TestCase
  def test_local
    parse_test('251111234567', '251', '11', '1234567', 'Ethiopia', false)
  end

  def test_mobile
    parse_test('+251911234567', '251', '91', '1234567', 'Ethiopia', true)
  end
end
