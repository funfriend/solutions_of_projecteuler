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

length_of_chains_with_cache = lambda {
  cache = Hash.new

  # seed
  cache[169] = cache[363601] = cache[1454] = 3
  cache[871] = cache[45361] = 2
  cache[872] = cache[45362] = 2

  lambda do |n, iter|
    t = n
    chain = []
    until cache[t]
      chain << t

      prev = t
      t = iter.call(prev)
      # meets a number like 145, and 1, 2
      cache[t] = 1 if t == prev
    end
    # update the cache of elems in the chain
    chain.each_with_index { |e, i| cache[e] = (chain.length - i) + cache[t] }
    # return elem in cache
    cache[n]
  end
}.call


puts (1..100_0000).count { |i| length_of_chains_with_cache.call(i, next_number) == 60 }
