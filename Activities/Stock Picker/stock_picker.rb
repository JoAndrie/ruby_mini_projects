def stock_picker(prices)
  return [] if prices.empty? || prices.length < 2
  
  best_profit = 0
  best_days = []
  
  (0...prices.length - 1).each do |buy_day|
    (buy_day + 1...prices.length).each do |sell_day|
      profit = prices[sell_day] - prices[buy_day]
      
      if profit > best_profit
        best_profit = profit
        best_days = [buy_day, sell_day]
      end
    end
  end
  
  best_days
end

puts stock_picker([17,3,6,9,15,8,6,1,10])