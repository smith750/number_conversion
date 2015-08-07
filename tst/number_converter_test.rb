require_relative "../src/number_converter"
require "test/unit"

class TestNumberConverter < Test::Unit::TestCase
  def test_zero
    assert_equal("Zero", NumberConverter.convert(0.0), "0 should convert to 'Zero'")
  end
  
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
  
  def test_two_hundred
    assert_equal("Two hundred", NumberConverter.convert(200.0), "200 should convert to 'Two hundred'")
  end
  
  def test_two_thousand_five_hundred_twenty_three
    assert_equal("Two thousand five hundred twenty-three", NumberConverter.convert(2523.0), "2523 should convert to 'Two thousand five hundred twenty three'")
  end
end