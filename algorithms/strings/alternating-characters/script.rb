test_cases = gets.to_i
test_cases.times do
  string = gets.strip
  new_string = string

  while new_string =~ /(\w)\1/
    new_string = new_string.gsub /(\w)\1/, '\1'
  end

  p string.length - new_string.length
end
