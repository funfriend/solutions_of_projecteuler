require 'set'

factorial = (1..9).reduce([1]) { |memo, i| memo << i * memo.last }

next_number = lambda do |n|
  next_elem = 0
  until n == 0
    n, r = n.divmod(10)
    next_elem += factorial[r]
  end
  next_elem
end

def length_of_chains(n, iter)
  s = Set.new
  while s.add?(n)
    n = iter.call(n)
  end
  s.length
end

puts (1..100_0000).count { |i| length_of_chains(i, next_number) == 60 }
