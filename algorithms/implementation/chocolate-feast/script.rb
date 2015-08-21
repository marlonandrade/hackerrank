def no_chocolates(money, price, exchange_free)
  amount = wrappers = money / price
  while wrappers >= exchange_free
    amount += 1
    wrappers += 1
    wrappers -= exchange_free
  end
  amount
end

test_cases = gets.to_i
test_cases.times do
  p no_chocolates(*gets.split(' ').map(&:to_i))
end
