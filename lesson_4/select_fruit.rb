# select a key-value pairs where the value is 'Fruit'

# **can I make one line loop?**
# def select_fruit(food)
#   fruit =  []
#   food.each do { |item| if item.key?('Fruit') fruit << item }
#   fruit
# end

def select_fruit(produce_hash)
  produce_keys = produce_hash.keys
  fruit = {}
  counter = 0

  loop do
    break if counter == produce_hash.size

    current_key = produce_keys[counter]
    current_value = produce_hash[current_key]

    if current_value == 'Fruit'
      fruit[current_key] = current_value
    end

    counter += 1
  end
  fruit
end

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

puts select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}
