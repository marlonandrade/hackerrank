test_cases = gets.to_i
test_cases.times do
  string = gets.strip

  operations = 0

  mid = string.length / 2
  mid.times do |index|
    curr = string[index]
    last = string[-index-1]

    if curr != last
      operations += (curr.ord - last.ord).abs
    end
  end

  p operations
end
