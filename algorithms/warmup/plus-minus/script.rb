total = gets.to_f

pos = 0
neg = 0
zero = 0

gets.split(' ').map(&:to_i).each do |num|
  if num > 0
    pos += 1
  elsif num < 0
    neg += 1
  else
    zero += 1
  end
end

p pos / total
p neg / total
p zero / total
