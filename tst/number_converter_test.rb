require_relative "../src/number_converter"
require "test/unit"

class TestNumberConverter < Test::Unit::TestCase
  def test_one
    assert_equal("One", NumberConverter.convert(1), "1 should convert to 'One'")
  end
  
  def test_twelve
    assert_equal("Twelve", NumberConverter.convert(12), "12 should convert to 'Twelve'")
  end
  
  def test_twenty_five
    assert_equal("Twenty-five", NumberConverter.convert(25), "25 should convert to 'Twenty-five'")
  end
end