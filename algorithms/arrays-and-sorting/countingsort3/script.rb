counts = Hash.new 0

test_cases = gets.to_i
test_cases.times do
  index, value = gets.strip.split ' '

  counts[index.to_i] += 1
end

elements = 0

(0...100).each do |i|
  elements += counts[i]
  print elements, ' '
end
