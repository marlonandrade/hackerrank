n, k, q = gets.strip.split.map &:to_i
array = gets.strip.split ' '

array.rotate! -k

q.times do
  puts array[gets.strip.to_i]
end
