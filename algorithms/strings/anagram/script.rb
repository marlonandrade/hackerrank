class Anagram < String
  def diff_from(other)
    elements = other.split ''

    self.each_char do |char|
      index = elements.index char
      elements.delete_at index if index
    end

    elements.size
  end
end

test_cases = gets.to_i
test_cases.times do
  concat = gets.strip

  length = concat.length
  if length.odd?
    p -1
  else
    a = Anagram.new concat[0...length/2]
    b = Anagram.new concat[length/2..-1]

    p a.diff_from b
  end
end
