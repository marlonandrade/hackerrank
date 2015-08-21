lines = gets.to_i
lines.times do |index|
  spaces = ' ' * (lines - index - 1)
  stair = '#' * (index + 1)

  puts "#{spaces}#{stair}"
end
