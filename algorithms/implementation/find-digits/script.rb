def exactly_divide(n)
  digits = n.to_s.split('').map &:to_i
  digits.select do |digit|
    n % digit == 0 if digit > 0
  end.count
end

test_cases = gets.to_i
test_cases.times do
  p exactly_divide(gets.to_i)
end
