EARTH_RADIUS = 6371
SPEEDS = {
  'metro' => 20,
  'bike' => 15,
  'foot' => 5
}

def degree_to_radians(angle)
  angle / 180 * Math::PI
end

def distance_between(point1, point2)
  point1_lat_in_radians = degree_to_radians point1[:lat]
  point2_lat_in_radians = degree_to_radians point2[:lat]
  point1_long_in_radians = degree_to_radians point1[:lon]
  point2_long_in_radians = degree_to_radians point2[:lon]

  (Math.acos(Math.sin(point1_lat_in_radians) * Math.sin(point2_lat_in_radians) + Math.cos(point1_lat_in_radians) * Math.cos(point2_lat_in_radians) * Math.cos(point2_long_in_radians - point1_long_in_radians)) * EARTH_RADIUS).round 2
end

no_attractions = gets.to_i

attractions = {}
no_attractions.times do
  id, lat, lon = gets.split ' '

  attractions[id.to_i] = {
    lat: lat.to_f,
    lon: lon.to_f
  }
end

test_cases = gets.to_i
test_cases.times do
  line = gets.split ' '

  hotel = {
    lat: line[0].to_f,
    lon: line[1].to_f
  }

  transport = line[2]
  travel_time = line[3].to_i

  distances = {}

  travel_distance = SPEEDS[transport] * (travel_time / 60.to_f)

  attractions.each do |id, attraction|
    distance = distance_between hotel, attraction

    if distance <= travel_distance
      distances[distance] ||= []
      distances[distance] << id
    end
  end

  out = []
  distances.sort do |(a_distance, a_ids), (b_distance, b_ids)|
    a_distance <=> b_distance
  end.map do |item|
    item.last.each do |id|
      out << id
    end
  end

  puts out.join ' '
end
