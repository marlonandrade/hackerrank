def get_gifts
  gets.strip.split(' ').map &:to_i
end

def get_costs
  gets.strip.split(' ').map &:to_i
end

test_cases = gets.to_i
test_cases.times do
  black, white = get_gifts
  black_cost, white_cost, convert_cost = get_costs

  diff = (black_cost - white_cost).abs

  cost = if convert_cost < diff
           if black_cost < white_cost
             black * black_cost + white * (black_cost + convert_cost)
           else
             black * (white_cost + convert_cost) + white * white_cost
           end
         else
           black * black_cost + white * white_cost
         end

  p cost
end
