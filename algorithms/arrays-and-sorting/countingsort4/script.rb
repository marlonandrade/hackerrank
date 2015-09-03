items = {}

max = 0

test_cases = gets.to_i
test_cases.times do |test_case|
  index, value = gets.strip.split ' '

  i = index.to_i

  max = i if i > max

  items[i] ||= []

  if test_case < test_cases / 2
    items[i] << '-'
  else
    items[i] << value
  end
end

line = ''
(0..max).each do |index|
  line << items[index].join(' ')
  line << ' '
end

puts line
