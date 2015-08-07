require_relative "../src/number_scrubber"
require "test/unit"

class TestNumberScrubber < Test::Unit::TestCase
  def test_number_only
    result = NumberScrubber.scrub("123")
    assert_equal(123.0, result, "123 scrubbed should be 123.0")
  end
  
  def test_number_and_mantissa
    result = NumberScrubber.scrub("123.45")
    assert_equal(123.45, result, "123.45 scrubbed should be 123.45")
  end
  
  def test_commas_cleaned
    result = NumberScrubber.scrub("123,456.45")
    assert_equal(123456.45, result, "123,456.45 scrubbed should be 123456.45")
  end
end