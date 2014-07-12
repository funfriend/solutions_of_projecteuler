# helping function
generalized_pentagonal_number = lambda { |i|
  [i.even? ? 1 : -1, i * (3*i - 1)/2]
}

cache = Array.new.push(1) # one element for p(0)

n = 1
cache << 0
loop do
  i = 0
  loop do
    i += 1
    sign, q = generalized_pentagonal_number.call(i)
    break if q > n
    cache[n] -= sign * cache[n - q]
    sign, q = generalized_pentagonal_number.call(-i)
    break if q > n
    cache[n] -= sign * cache[n - q]
  end
  cache[n] %= 100_0000
  break if cache[n] == 0
  n += 1; cache << 0
end

puts n
