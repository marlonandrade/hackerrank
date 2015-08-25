def sanitize(text)
  text.gsub /\s/, ''
end

def encrypt(text)
  text = sanitize text
  len = text.length

  rows = Math.sqrt(len).floor
  cols = Math.sqrt(len).ceil

  while rows * cols < len
    rows += 1
  end

  encrypted = ''

  cols.times do |col|
    rows.times do |row|
      index = row * cols + col
      encrypted << (text[index] || '')
    end

    encrypted << ' '
  end

  encrypted
end

text = gets.strip
puts encrypt text
