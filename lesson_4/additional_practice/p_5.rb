flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# flintstones.each_with_index do |value, index|
#   if value.start_with?('Be')
#     index
#   end
# end

# flintstones.index { |name| name.start_with?('Be') }
flintstones.index { |name| name[0, 2] == 'Be' }
