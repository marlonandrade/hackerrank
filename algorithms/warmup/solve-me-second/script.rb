test_cases = gets.to_i
test_cases.times do
  p gets.split(' ').reduce(0) { |total, value| total + value.to_i }
end
