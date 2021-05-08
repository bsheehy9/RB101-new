arr = [['1', '8', '11'], ['2', '6', '13'], ['2', '12', '15'], ['1', '8', '9']]

p arr.sort

arr.sort_by! do |sub_arr|
  sub_arr.map { |num| num.to_i }
end

p arr
