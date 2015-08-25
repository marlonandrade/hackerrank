class Fixnum
  def is_kaprekar?
    str = (self ** 2).to_s
    mid = str.length / 2
    sum = str[0...mid].to_i + str[mid..-1].to_i
    self == sum
  end
end

def kaprekar_numbers(low, high)
  numbers = (low..high).select do |number|
    number.is_kaprekar?
  end

  if numbers.empty?
    'INVALID RANGE'
  else
    numbers.join ' '
  end
end

low = gets.to_i
high = gets.to_i

puts kaprekar_numbers low, high
