def possible_values(stones, a, b)
  values = []

  stones.times do |i|
    values << a * (stones - i - 1) + b * i
  end

  values
end

test_cases = gets.to_i
test_cases.times do
  stones = gets.to_i
  a = gets.to_i
  b = gets.to_i
  puts possible_values(stones, a, b).uniq.sort.join(' ')
end
