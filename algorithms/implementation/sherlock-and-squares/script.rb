test_cases = gets.to_i
test_cases.times do
  inputs = gets.split.map &:to_i
  first = Math.sqrt(inputs.first).ceil
  last = Math.sqrt(inputs.last).floor
  p last - first + 1
end
