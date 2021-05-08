# enumerable#any? on an array
[1, 2, 3].any? do |num|
  num > 2
end
# => true

# enumerable#any? on an array
{ a: "ant", b: "bear", c: "cat" }.any? do |_key, value|
  value.size > 4
end
# => false

# enumerable#all? on an array
[1, 2, 3].any? do |num|
  num > 2
end
# => false

# enumerable#any? on an array
{ a: "ant", b: "bear", c: "cat" }.any? do |_key, value|
  value.length >= 3
end
# => true

[1, 2, 3].each_with_index do |num, index|
  puts "The index of #{num} is #{index}."
end

# The index of 1 is 0.
# The index of 2 is 1.
# The index of 3 is 2.
# => [1, 2, 3]

{ a: "ant", b: "bear", c: "cat" }.each_with_index do |pair, index|
  puts "The index of #{pair} is #{index}."
end

# The index of [:a, "ant"] is 0.
# The index of [:b, "bear"] is 1.
# The index of [:c, "cat"] is 2.
# => { :a => "ant", :b => "bear", :c => "cat" }

{ a: "ant", b: "bear", c: "cat" }.each_with_object([]) do |pair, array|
  array << pair.last
end
# => ["ant", "bear", "cat"]

{ a: "ant", b: "bear", c: "cat" }.each_with_object({}) do |(key, value), hash|
  hash[value] = key
end
# => { "ant" => :a, "bear" => :b, "cat" => :c }

[1, 2, 3].first
# => 1

{ a: "ant", b: "bear", c: "cat" }.first(2)
# => [[:a, "ant"], [:b, "bear"]]

[1, 2, 3].include?(1)
# => true

{ a: "ant", b: "bear", c: "cat" }.include?("ant")
# => false

{ a: "ant", b: "bear", c: "cat" }.include?(:a)
# => true

odd, even = [1, 2, 3].partition do |num|
  num.odd?
end

odd  # => [1, 3]
even # => [2]

long, short = { a: "ant", b: "bear", c: "cat" }.partition do |key, value|
  value.size > 3
end
# => [[[:b, "bear"]], [[:a, "ant"], [:c, "cat"]]]

long.to_h # => { :b => "bear" }
short.to_h  # => { :a => "ant", :c => "cat" }
