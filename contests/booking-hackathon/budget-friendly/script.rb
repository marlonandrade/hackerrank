no_cities, budget = gets.split.map &:to_i

cities = {}
no_cities.times do |city|
  no_hotels = gets.to_i

  hotels = []
  no_hotels.times do
    price, score = gets.split

    price = price.to_i
    score = score.to_f

    if price <= budget
      prices = hotels.map do |hotel|
        if hotel[:score] > score
          hotel[:price]
        end
      end

      hotel = {
        price: price,
        score: score
      }

      min = prices.compact.min || 10001

      hotels << hotel if price < min
    end
  end

  cities[city] = hotels.sort do |a, b|
    b[:score] <=> a[:score]
  end
end

first = cities.values.first
other = cities.values[1..-1]

best = nil

first.product(*other) do |combination|
  price = 0
  score = 0

  combination.each do |hotel|
    price += hotel[:price]
    score += hotel[:score]

    break if price > budget
  end

  if price <= budget
    best = score
    break
  end
end

if best
  puts '%.2f' % best.round(2)
else
  p -1
end
