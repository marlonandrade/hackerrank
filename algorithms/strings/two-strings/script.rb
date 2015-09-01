test_cases = gets.to_i
test_cases.times do
  first = gets.strip.split ''
  second = gets.strip.split ''

  intersection = first & second

  result = if intersection.empty?
             'NO'
           else
             'YES'
           end

  puts result
end
