ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.keep_if { |_, value| value < 100 }

# ages.select! { |_, value| value < 100 }

puts ages
