require "./util/integer"

class Integer
  include Util::Integer
end


primes = []
1000.upto(9999) do |i|
  primes << i if i.prime?
end

primes.each_index do |i|
  (i+1).upto(primes.size-1) do |j|
    next unless primes[i].permutation_of? primes[j]
    next unless primes.include?(2*primes[j]-primes[i])
    next unless primes[i].permutation_of?(2*primes[j]-primes[i])
    p primes[i], primes[j]
  end
end

# require "test/unit"

# class Test49 < Test::Unit::TestCase
#   def test_permutation
#     assert_equal true, 123.permutation_of?(321)
#   end
# end