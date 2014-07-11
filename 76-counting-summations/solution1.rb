target = 100
coins = (0...target).to_a

count = Array.new(target+1) { Array.new(coins.size) }
# init
count[0].each_index { |i| count[0][i] = 1 }

(1..target).each do |n|
  count[n][0] = 0
  (1...coins.size).each do |i|
    count[n][i] = count[n][i-1] + (n < coins[i] ? 0 : count[n - coins[i]][i])
  end
end

puts count.last.last
