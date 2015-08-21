length, test_cases = gets.split(' ').map &:to_i
width = gets.split(' ').map &:to_i
test_cases.times do
  enters, exits = gets.split(' ').map &:to_i
  p width[enters..exits].min
end
