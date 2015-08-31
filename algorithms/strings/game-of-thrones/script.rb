class PalindromeMatcher
  def initialize(string)
    @string = string
  end

  def palindrome?
    count_letters.values.select do |count|
      count.odd?
    end.size <= 1
  end

  private
  def count_letters
    letters = {}

    @string.each_char do |char|
      letters[char] ||= 0
      letters[char] += 1
    end

    letters
  end
end

class String
  def palindrome?
    PalindromeMatcher.new(self).palindrome?
  end
end

anagram = gets.strip

result = if anagram.palindrome?
           'YES'
         else
           'NO'
         end

puts result
