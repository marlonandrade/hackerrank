def tree_size(n)
  if n == 0
    1
  else
    if n % 2 == 0
      1 + tree_size(n - 1)
    else
      2 * tree_size(n - 1)
    end
  end
end

test_cases = gets.to_i
test_cases.times do
  p tree_size(gets.to_i)
end
