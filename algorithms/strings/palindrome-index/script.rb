def remove_from_right?(string, index)
  string[index..index+1] == string[-index-3..-index-2].reverse
end

def remove_from_left?(string, index)
  string[index+1..index+2] == string[-index-2..-index-1].reverse
end

test_cases = gets.to_i
test_cases.times do
  string = gets.strip

  palindrome = -1

  mid = string.length / 2
  mid.times do |index|
    curr = string[index]
    last = string[-index-1]

    unless curr == last
      if remove_from_left? string, index
        palindrome = index
      elsif remove_from_right? string, index
        palindrome = string.length() - index - 1
      end

      break
    end
  end

  p palindrome
end
