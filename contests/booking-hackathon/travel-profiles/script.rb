no_hotels = gets.to_i

hotels = {}

no_hotels.times do
  line = gets.strip.split ' '

  id = line.first.to_i
  price = line[1].to_i
  facilities = line[2..-1].sort

  hotels[id] = {
    price: price,
    facilities: facilities
  }
end

test_cases = gets.to_i
test_cases.times do
  line = gets.strip.split ' '

  budget = line.first.to_i
  required = line[1..-1].sort

  matches = hotels.select do |id, hotel|
    hotel[:price] <= budget &&
      hotel[:facilities] & required == required
  end.sort do |(a_id, a_hotel), (b_id, b_hotel)|
    sort = b_hotel[:facilities].length <=> a_hotel[:facilities].length

    if sort == 0
      sort = a_hotel[:price] <=> b_hotel[:price]
    end

    if sort == 0
      sort = a_id <=> b_id
    end

    sort
  end

  ids = matches.map do |match|
    match[0]
  end

  puts ids.join ' '
end
