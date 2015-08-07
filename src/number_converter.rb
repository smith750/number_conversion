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
    if tens_digit == 0
      number_str = convert_ones_digit(ones_digit)
    else
      number_str = convert_tens_digit(tens_digit, ones_digit)
    end
    capitalize(number_str)
  end
  
  def capitalize(number_str)
    number_str[0].upcase + number_str[1...number_str.length]
  end
  
  def convert_ones_digit(digit, silence_zeros = false)
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
  
  def convert_tens_digit(tens_digit, ones_digit)
    case tens_digit
    when 0
      convert_ones_digit(ones_digit)
    when 1
      convert_teens(ones_digit)
    else
      converted_tens_digit = convert_enties(tens_digit)
      converted_ones_digit = convert_ones_digit(ones_digit, true)
      if converted_ones_digit.size > 0
        "#{converted_tens_digit}-#{converted_ones_digit}"
      else
        converted_tens_digit
      end
    end
  end
  
  def convert_teens(ones_digit)
    case ones_digit
    when 0
      "ten"
    when 1
      "eleven"
    when 2
      "twelve"
    when 3
      "thirteen"
    when 5
      "fifteen"
    else
      convert_ones_digit(ones_digit)+"teen"
    end
  end
  
  def convert_enties(tens_digit)
    case tens_digit
    when 2
      "twenty"
    when 3
      "thirty"
    when 4
      "forty"
    when 5
      "fifty"
    else
      convert_ones_digit(tens_digit)+"ty"
    end
  end
end