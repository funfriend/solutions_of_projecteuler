require 'prime'

num_of_prime_summation = lambda do |n|
  coins = Prime.each(n-1).to_a
  parts = Array.new(n, 0).unshift(1)
  coins.each do |c|
    (c..n).each do |i|
      parts[i] += parts[i - c]
    end
  end
  parts.last
end


n = 5
until num_of_prime_summation.call(n) > 5_000
  n += 1
end

puts n
