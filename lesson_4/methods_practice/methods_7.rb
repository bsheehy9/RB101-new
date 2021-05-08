[1, 2, 3].any? do |num|
  puts num
  num.odd?
end

# block return value is the return value of last expression
# any returns boolean detemined by block 
# one block returns true, any stops iterating 
# puts is only called once on 1
