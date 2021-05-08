def count
  ['ant', 'bat', 'caterpillar'].count do |str|
    str.length < 4
  end
end

puts count

# count the number of elements the block returns true
