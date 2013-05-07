=begin
res = []
1.upto(999999) do |i|
  base10, base2 = i.to_s, i.to_s(2)

  res << i if base10 == base10.reverse and base2 == base2.reverse
end
p res.inject(0, :+)
=end

def palindrome?(n,base=10)
  t, k = 0, n
  until k == 0
    t = base*t + k%base
    k /= base
  end
  if t == n then true else false end
end
#but this edition seems to be more efficient ...
def second_palindrome?(n, base=10)
  str = n.to_s(base)
  if str == str.reverse then true else false end
end


def generate_palindrome_from(n, is_odd_length=false, base=10)
  res = n
  n/=base if is_odd_length
  until n==0
    res = res*base + n%base
    n /= base
  end
  res
end
#however, this one is slower ...
def second_generate_palindrome_from(n, is_odd_length=false, base=10)
  str = n.to_s(base)
  str.concat is_odd_length ? str[0...-1].reverse : str.reverse
  str.to_i(base)
end


limit = 1_000_000
res = []

seed = 1
p = generate_palindrome_from(seed, true)
while p < limit
  res << p if palindrome?(p, 2)
  p = generate_palindrome_from(seed+=1, true)
end

seed = 1
p = generate_palindrome_from(seed)
while p < limit
  res << p if palindrome?(p,2)
  p = generate_palindrome_from(seed+=1)
end

p res
p res.inject(:+)
=begin
require "benchmark"
TESTS = 10_000
Benchmark.bmbm do |results|
  results.report("palindrome?:") { TESTS.times { palindrome?(1234554321) } }
  results.report("second_palindrome:") { TESTS.times { second_palindrome?(1234554321) } }
  results.report("generate_palindrome_from:") { TESTS.times { generate_palindrome_from(55555) } }
  results.report("second_generate_palindrome_from:") { TESTS.times { second_generate_palindrome_from(55555) } }
end
=end