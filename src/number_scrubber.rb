module NumberScrubber
  def NumberScrubber.scrub(number)
    scrubbed_number = NumberScrubber.clean_string(number)
    scrubbed_number.to_f
  end
  
  def NumberScrubber.clean_string(number)
    scrubbed = number.gsub(/[^\d\.]/, "").gsub(/^0+/, "")
    if !scrubbed.index(".").nil?
      scrubbed = scrubbed.gsub(/0*/,"")
    end
    scrubbed
  end
end