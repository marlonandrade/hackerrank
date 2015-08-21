gets.to_i.times do
  no_students, needed_presents = gets.split(' ').map(&:to_i)
  students = gets.split(' ').map(&:to_i).select { |s| s <= 0}
  if students.length < needed_presents
    puts "YES"
  else
    puts "NO"
  end
end
