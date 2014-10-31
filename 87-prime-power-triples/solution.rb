require 'prime'
require 'set'

upper_bound = 50_000_000

cache = [2, 3, 4].map do |pow|
  Prime.each(upper_bound**(1.0 / pow)).each_with_object({}) do |e, a|
    a[e] = e**pow
  end
end

values = Set.new

cache[0].keys.each do |a|
  cache[1].keys.each do |b|
    cache[2].keys.each do |c|
      t = cache[0][a] + cache[1][b] + cache[2][c]
      values.add(t) if t < upper_bound
    end
  end
end

puts values.size
