title = "the flintstones rock"

def titleize(words)
  words.split.map { |word| word.capitalize }.join(' ')
end

puts titleize(title)

title.split.shift