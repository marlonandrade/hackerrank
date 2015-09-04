number = gets.to_i
items = gets.strip.split(' ').map &:to_i

diffs = {}
items.sort.each_cons 2 do |a, b|
  diffs[b-a] ||= []
  diffs[b-a] << [a, b]
end

min_diff = diffs.keys.sort.first

puts diffs[min_diff].join ' '
