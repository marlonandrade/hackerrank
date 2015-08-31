class String
  ALL_LETTERS = ('a'..'z').to_a

  def pangram?
    is_pangram = true

    down = self.downcase

    ALL_LETTERS.each do |letter|
      is_pangram = false unless down.include? letter
    end

    is_pangram
  end
end

sentence = gets.strip
result = if sentence.pangram?
           'pangram'
         else
           'not pangram'
         end

puts result
