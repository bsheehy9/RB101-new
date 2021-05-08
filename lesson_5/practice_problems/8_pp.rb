hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

vowels = 'aeiou'

hsh.each_value do |words|
  words.each do |word|
    word.chars.each do |letter|
      puts letter if vowels.include? letter
    end
  end
end
