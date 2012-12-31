require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

## Tonga
class TOTest < Phonie::TestCase
  def test_local
    parse_test('+67679321', '676', '79', '321', "Tonga", false)
  end

  def test_mobile
    parse_test('67688321', '676', '88', '321', "Tonga", true)
  end
end
