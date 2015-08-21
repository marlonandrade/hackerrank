gets.to_i.times do
  n = gets.to_i
  t = 5 * (2 * n % 3)
  result = if t > n
             '-1'
           else
             fives = '5' * (n - t)
             threes = '3' * t
             "#{fives}#{threes}"
           end
  puts result
end
