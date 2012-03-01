require File.expand_path(File.dirname(__FILE__) + '/../test_helper')

## Nepal
class NPTest < Phoner::TestCase
  def test_local
    parse_test('9779812345678', '977', '98', '12345678', "Nepal", true)
    parse_test('97711234567', '977', '1', '1234567', "Nepal", false)
    parse_test('97761123456', '977', '61', '123456')
    # TODO: Enforce number lengths, as many countries have variable area code lengths, but the total number lenght is always the same
    # phone = Phoner::Phone.parse("977611234567")
    # assert_nil phone
    # phone = Phoner::Phone.parse("9771123456")
    # assert_nil phone
  end
end
