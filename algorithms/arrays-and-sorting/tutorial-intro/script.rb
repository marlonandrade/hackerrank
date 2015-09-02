number = gets.to_i
length = gets

items = gets.strip.split(' ').map &:to_i

p items.index(number)
