a = [1, 2, 3, 'A', 4, 'A', 5]

a.each do |value|
  if value == 'A'
    a.insert(a.size - 1, a.delete_at(a.find_index('A')))
  end
end

p a
