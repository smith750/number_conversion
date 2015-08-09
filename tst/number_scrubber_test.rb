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
  
  def test_leading_zeros_cleaned
    result = NumberScrubber.clean_string("000123")
    assert_equal("123", result, "'000123' should be scrubbed to 123")
  end
  
  def test_trailing_zeroes_cleaned
    result = NumberScrubber.clean_string("123.4500000")
    assert_equal("123.45", result, "'123.45000000' should be scrubbed to 123.45")
    result2 = NumberScrubber.clean_string("123000")
    assert_equal("123000", result2, "'123000' should stay '123000'")
  end
end