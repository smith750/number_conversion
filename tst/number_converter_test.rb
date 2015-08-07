require_relative "../src/number_converter"
require "test/unit"

class TestNumberConverter < Test::Unit::TestCase
  def test_one
    assert_equal("One", NumberConverter.convert(1.0), "1 should convert to 'One'")
  end
  
  def test_twelve
    assert_equal("Twelve", NumberConverter.convert(12.0), "12 should convert to 'Twelve'")
  end
  
  def test_twenty_five
    assert_equal("Twenty-five", NumberConverter.convert(25.0), "25 should convert to 'Twenty-five'")
  end
  
  def test_two_hundred_seventy_three
    assert_equal("Two hundred seventy-three", NumberConverter.convert(273.0), "273 should convert to 'Two hundred seventy-three'")
  end
end