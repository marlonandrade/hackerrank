gets
string = gets
shift_amount = gets.to_i

LOW_START = 'a'.codepoints.first
LOW_END = 'z'.codepoints.first

UP_START = 'A'.codepoints.first
UP_END = 'Z'.codepoints.first

def rotate(key_code, amount, min, max)
  total = max - min + 1
  diff = key_code - min
  min + ((diff + amount) % total)
end

def shift(key_code, amount)
  if key_code.between? LOW_START, LOW_END
    rotate(key_code, amount, LOW_START, LOW_END)
  elsif key_code.between? UP_START, UP_END
    rotate(key_code, amount, UP_START, UP_END)
  else
    key_code
  end
end

string.each_codepoint do |key_code|
  print shift(key_code, shift_amount).chr
end
