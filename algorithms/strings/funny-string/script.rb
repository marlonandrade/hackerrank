class String
  def funny?
    self.codepoints_diff == self.reverse.codepoints_diff
  end

  def codepoints_diff
    self.codepoints.each_cons(2).map do |a, b|
      (b - a).abs
    end
  end
end
def exactly_divide(n)
  digits = n.to_s.split('').map &:to_i
  digits.select do |digit|
    n % digit == 0 if digit > 0
  end.count
end

test_cases = gets.to_i
test_cases.times do
  string = gets.strip

  result = if string.funny?
             'Funny'
           else
             'Not Funny'
           end

  puts result
end
