class NumberConverter
  def NumberConverter.convert(number)
    nc = NumberConverter.new(number)
    nc.convert()
  end
  
  BLOCK_NAMES = ["", "thousand", "million", "trillion", "quadrillion", "quintillion"]
  
  def initialize(number)
    @number = number
  end
  
  def convert()
    if @number == 0.0
      return "Zero"
    end
    num = @number.to_i
    amount_in_hundreds_blocks = convert_blocks(num, [])
    number_str = join_blocks(amount_in_hundreds_blocks)
    capitalize(number_str)
  end
  
  def join_blocks(converted_blocks)
    right_blocks = converted_blocks.reverse
    tagged_blocks = converted_blocks.zip(BLOCK_NAMES).select{|block| block[0].length > 0}
    right_blocks = tagged_blocks.reverse
    right_blocks.collect{|block| "#{block[0]} #{block[1]}".strip}.join(" ").strip
  end
  
  def convert_blocks(remaining_amount, converted_blocks)
    if remaining_amount == 0
      converted_blocks
    else
      converted_hundreds_block = convert_hundred_block(remaining_amount)
      remaining_amount_without_hundreds_block = (remaining_amount - (remaining_amount % 1000)) / 1000
      converted_blocks << converted_hundreds_block
      convert_blocks(remaining_amount_without_hundreds_block, converted_blocks)
    end
  end
  
  def convert_hundred_block(num)
    ones_digit = (num % 10)
    tens_digit = (num % 100) / 10
    hundreds_digit = (num % 1000) / 100
    converted_hundreds_digit = convert_hundreds_digit(hundreds_digit)
    converted_tens_digit = convert_tens_digit(tens_digit, ones_digit)
    number_str = converted_hundreds_digit.length > 0 && converted_tens_digit.length > 0 ? "#{converted_hundreds_digit} #{converted_tens_digit}" : converted_hundreds_digit.length > 0 ? converted_hundreds_digit : converted_tens_digit
  end
  
  def capitalize(number_str)
    number_str[0].upcase + number_str[1...number_str.length]
  end
  
  def convert_ones_digit(digit)
    case digit
    when 0
      ""
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
      converted_ones_digit = convert_ones_digit(ones_digit)
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
    when 8
      "eighty" # no double t's!!
    else
      convert_ones_digit(tens_digit)+"ty"
    end
  end
  
  def convert_hundreds_digit(hundreds_digit)
    converted_hundreds_digit = convert_ones_digit(hundreds_digit)
    if converted_hundreds_digit.length > 0
      "#{converted_hundreds_digit} hundred"
    else
      converted_hundreds_digit
    end
  end
end