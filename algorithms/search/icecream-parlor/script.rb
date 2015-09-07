test_cases = gets.to_i

def solve_test_case
  budget = gets.to_i
  flavors = gets.to_i

  prices = gets.strip.split(' ').map &:to_i

  enumerated = []
  prices.each_with_index do |price_a, index_a|
    prices.each_with_index do |price_b, index_b|
      next if index_a == index_b

      if price_a + price_b == budget
        puts "#{index_a+1} #{index_b+1}"
        return
      end
    end
  end
end

test_cases.times { solve_test_case }
