require 'prime'
require 'pp'

def permutation?(a, b)
  arr = Array.new(10, 0)
  while(a > 0)
    a, mod = a.divmod(10)
    arr[mod] += 1
  end
  while(b > 0)
    b, mod = b.divmod(10)
    arr[mod] -= 1
  end
  arr.all? { |i| i == 0 }
end


n = 10_000_000
primes = Prime.each(5000).select { |p| p > 2000 }

pp primes.each_with_index.flat_map { |p1, i|
  primes[i..-1].map { |p2|
    num = p1 * p2
    phi = (p1 - 1) * (p2 - 1)
    [p1, p2, num, phi]
  }.select { |_, _, num, phi| num < n && permutation?(num, phi) }
}.sort_by { |_, _, num, phi| num.to_f / phi }
