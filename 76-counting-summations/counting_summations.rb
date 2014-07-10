target = 100

units = (1...target).to_a

ways = Array.new(target+1, 0)
ways[0] = 1

units.each do |unit|
  (unit..target).each do |n|
    ways[n] += ways[n - unit]
  end
end

puts ways.last
