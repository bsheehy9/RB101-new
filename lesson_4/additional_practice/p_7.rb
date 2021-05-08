statement = "The Flintstones Rock"

# this isn't working
# h = statement.each_char.tally

# puts statement.each_char.with_object(Hash.new(0)) { |c,h| h[c] += 1 }

result = {}
letters = statement.chars.to_a.uniq
#letters = ('A'..'Z').to_a + ('a'..'z').to_a
letters.each do |letter|
  letter_frequency = statement.scan(letter).count
  result[letter] = letter_frequency
end

puts result
