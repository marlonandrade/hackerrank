NUM_IN_WORDS = {
  1 => 'one',
  2 => 'two',
  3 => 'three',
  4 => 'four',
  5 => 'five',
  6 => 'six',
  7 => 'seven',
  8 => 'eight',
  9 => 'nine',
  10 => 'ten',
  11 => 'eleven',
  12 => 'twelve',
  13 => 'thirteen',
  14 => 'fourteen',
  15 => 'fifteen',
  16 => 'sixteen',
  17 => 'seventeen',
  18 => 'eighteen',
  19 => 'nineteen',
  20 => 'twenty',
  21 => 'twenty one',
  22 => 'twenty two',
  23 => 'twenty three',
  24 => 'twenty four',
  25 => 'twenty five',
  26 => 'twenty six',
  27 => 'twenty seven',
  28 => 'twenty eight',
  29 => 'twenty nine'
}

def hour_in_words(hours)
  hours = hours % 12
  hours = 1 if hours == 0
  NUM_IN_WORDS[hours]
end

def minute_in_words(minutes)
  NUM_IN_WORDS[minutes]
end

def minute_string(minutes)
  minute_str = 'minute'

  if minutes > 1
    minute_str << 's'
  end

  minute_str
end

def time_in_words(hours, minutes)
  if minutes <= 30
    hour_words = hour_in_words hours

    if minutes == 0
      "#{hour_words} o' clock"
    else
      prefix = case minutes
               when 15
                 "quarter"
               when 30
                 "half"
               else
                 minute_words = minute_in_words minutes
                 minute_str = minute_string minutes
                 "#{minute_words} #{minute_str}"
               end

      "#{prefix} past #{hour_words}"
    end
  else
    hour_words = hour_in_words hours + 1

    prefix = case minutes
             when 45
               "quarter"
             else
               minutes = 60 - minutes
               minute_words = minute_in_words minutes
               minute_str = minute_string minutes
               "#{minute_words} #{minute_str}"
             end

    "#{prefix} to #{hour_words}"
  end
end

hours = gets.to_i
minutes = gets.to_i

puts time_in_words hours, minutes
