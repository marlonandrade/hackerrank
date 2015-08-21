diff = 0

test_cases = gets.to_i
test_cases.times do |index|
  nums = gets.split(' ').map(&:to_i)
  diff += nums[index] - nums[test_cases - 1 - index]
end

p diff.abs
