require_relative "../src/number_converter"
require "test/unit"

class TestNumberConverter < Test::Unit::TestCase
  def test_one
    assert_equal("one", NumberConverter.convert(1), "1 should convert to 'one'")
  end
end