[1, 2, 3].select do |num|
  num > 5
  'hi'
end

# => [1, 2, 3]
# select returns based on truthiness of return value
# even though none of the numbers > 5, 'hi' is "truthy"
