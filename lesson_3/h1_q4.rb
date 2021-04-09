def ip_number?(number)
  (0..255).include?(number.to_i)
end

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated_words.size == 4

  while dot_separated_words.size > 0
    word = dot_separated_words.pop
    return false unless ip_number?(word)
  end
  true
end

puts dot_separated_ip_address?("11.261.23.55")
