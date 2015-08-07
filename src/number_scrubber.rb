module NumberScrubber
  def NumberScrubber.scrub(number)
    scrubbed_number = NumberScrubber.clean_string(number)
    scrubbed_number.to_f
  end
  
  def NumberScrubber.clean_string(number)
    number.gsub(/[^\d\.]/, "")
  end
end