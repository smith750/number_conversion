class NumberConverter
  def NumberConverter.convert(number)
    nc = NumberConverter.new(number)
    nc.convert()
  end
  
  def initialize(number)
    @number = number
  end
  
  def convert()
    ones_digit = (@number % 10)
    tens_digit = (@number % 100) / 10
    hundreds_digit = (@number % 1000) / 100
    convert_single_digit(ones_digit)
  end
  
  def convert_single_digit(digit, silence_zeros = false)
    case digit
    when 0
      silence_zeros ? "" : "zero"
    when 1
      "one"
    when 2
      "two"
    when 3
      "three"
    when 4
      "four"
    when 5
      "five"
    when 6
      "six"
    when 7
      "seven"
    when 8
      "eight"
    when 9
      "nine"
    end
  end
end