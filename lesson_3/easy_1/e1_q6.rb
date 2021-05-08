# starting with the string: 
famous_words = "seven years ago..."

# show two ways to add "Four score and"

puts "Four score and " << famous_words

puts "Four score and " + famous_words

puts famous_words.prepend("Four score and ")
