# implement a double_numbers! method that mutates its argument
def double_numbers!(numbers)
  counter = 0

  loop do
    break if counter == numbers.size

    numbers[counter] = numbers[counter] * 2

    counter += 1
  end
end

# doubles the numbers that have odd indices
def double_odd_index(numbers)
  doubled_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size
    doubled_numbers << numbers[counter] * 2 if counter.odd?
    counter += 1
  end
  doubled_numbers
end

# create a method called multiply that can take an additional argument
# to determine the transformation criteria
def multiply(numbers, multiply_by)
  counter = 0
  multiplied_numbers = []
  loop do
    break if counter == numbers.size

    multiplied_numbers << numbers[counter] * multiply_by

    counter += 1
  end
  multiplied_numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]

double_numbers!(my_numbers)

# after my_numbers was mutated
puts double_odd_index(my_numbers)
