{ a: 'ant', b: 'bear' }.map do |_key, value|
  if value.size > 3
    value
  end
end

# => [nil, "bear"]
