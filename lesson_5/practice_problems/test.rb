def test(arr)
  arr.map do |sub_arr|
    sub_arr.map do |letter|
      letter.upcase
    end
  end
end

p test([['a', 'b'], ['c', 'd'], ['e', 'f']])
