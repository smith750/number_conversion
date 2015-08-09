require_relative "./number_scrubber"
require_relative "./number_validator"
require_relative "./number_converter"

def convert_amount(s)
  validation_results = NumberValidator.validate(s)
  if !validation_results.success?
    puts validation_results.error_messages.join("\n")
  else
    converted_s = NumberConverter.convert(NumberScrubber.scrub(s))
    puts "#{converted_s} dollars"
  end
end

arg_val = ARGV[0]
if !arg_val.nil?
  convert_amount(arg_val)
else
  puts "Please enter number or q to quit"
  val = gets().strip()
  while val != "q"
    convert_amount(val)
    puts "Please enter number or q to quit"
    val = gets().strip()
  end
end