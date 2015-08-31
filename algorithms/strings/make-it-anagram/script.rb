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

a = Anagram.new gets.strip
b = Anagram.new gets.strip

p a.diff_from(b) + b.diff_from(a)
