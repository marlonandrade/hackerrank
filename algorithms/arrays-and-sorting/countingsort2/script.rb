number = gets.to_i

counts = Hash.new 0

gets.strip.split(' ').each do |item|
  counts[item.to_i] += 1
end

(0...100).each do |i|
  list = ""

  if counts[i] > 0
    list << "#{i} " * counts[i]
  end

  print list.chomp
end
