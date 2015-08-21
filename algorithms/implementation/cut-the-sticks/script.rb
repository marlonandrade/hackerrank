no_sticks = gets.to_i
sticks = gets.split(' ').map &:to_i
while sticks.length > 0
  p sticks.length
  min = sticks.min
  sticks.map! { |s| s - min }.select! { |s| s > 0 }
end
