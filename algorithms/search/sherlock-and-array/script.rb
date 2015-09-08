def solve_test_case
  length = gets.to_i
  array = gets.strip.split(' ').map &:to_i

  sum = array.reduce :+

  left = 0
  right = sum

  equal_sides = false

  array.each do |element|
    right -= element

    if left == right
      equal_sides = true
      break
    end

    left += element
  end

  if equal_sides
    puts 'YES'
  else
    puts 'NO'
  end
end

test_cases = gets.to_i
test_cases.times { solve_test_case }
