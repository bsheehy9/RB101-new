[1, 2, 3].reject do |num|
  puts num
end

# => [1, 2, 3]
# returns new array where block is rejected
# puts always returns nil so all items included in new array
