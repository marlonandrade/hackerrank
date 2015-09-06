no_facilities = gets.to_i

facilities = []
no_facilities.times do
  facilities << gets.strip
end

description = ''

while line = gets
  description << line.strip
end

facilities.select do |facility|
  description =~ /#{facility}/i
end.sort.each do |match|
  puts match
end
