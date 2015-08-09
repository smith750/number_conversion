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
  
  def test_four_hundred_thousand
    assert_equal("Four hundred thousand", NumberConverter.convert(400000.0), "400,000 should convert to 'Four hundred thousand'")
  end
  
  def test_four_hundred_seventy_five_thousand_eight_hundred_eighty_three
    assert_equal("Four hundred seventy-five thousand eight hundred eighty-three", NumberConverter.convert(475883.0), "Big numbers should convert correct")
  end
  
  def test_three_million
    assert_equal("Three million", NumberConverter.convert(3000000.0), "3,000,000 should convert to three million")
  end
  
  def test_fractional_part
    assert_equal("One and 03/100", NumberConverter.convert(1.03), "1.03 should convert to One and 03/100")
  end
  
  def test_fractional_part_with_padding
    assert_equal("One and 30/100", NumberConverter.convert(1.3), "1.3 should convert to One and 03/100")
  end
end