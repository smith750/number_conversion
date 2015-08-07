require_relative './number_scrubber'

module NumberValidator
  class Success
  end
  
  class Failure
    def initialize(message)
      @message = message
    end
    
    attr_reader :message
  end
  
  def NumberValidator.validate(value)
    results = []
    results << NumberValidator.value_numeric?(value)
    results << NumberValidator.value_positive?(value)
    results << NumberValidator.value_within_size_range?(value)
    failures = results.select {|val| val.class == NumberValidator::Failure}
    if failures.empty?
      [results[0]]
    else
      failures
    end
  end
  
  def NumberValidator.value_numeric?(value)
    if !(value =~ /^[\d,\.\-]+$/)
      return Failure.new("\"#{value}\" is not numeric")
    else
      return Success.new
    end
  end
  
  def NumberValidator.value_positive?(value)
    if value =~ /^\-/
      return Failure.new("\"#{value}\" should be a positive number")
    else
      return Success.new
    end
  end
  
  def NumberValidator.value_within_size_range?(value)
    scrubbed = NumberScrubber.clean_string(value)
    scrubbed_point = scrubbed.index(".")
    if !scrubbed_point.nil? && scrubbed_point >= 0
      if scrubbed_point > 21
        return Failure.new("\"#{value}\" is too large to parse")
      elsif scrubbed.size - scrubbed_point > 3
        return Failure.new("\"#{value}\" has a fractional part too large to parse")
      end
    elsif scrubbed.length > 21
      return Failure.new("\"#{value}\" is too large to parse")
    end
    return Success.new
  end
end