require "set"

def prime? n
  return false if n < 2
  return true if n == 2 || n == 3
  return false if n%2 == 0 || n%3 == 0
  lower = Math.sqrt(n).floor
  i = 5
  until i > lower
    return false if n%i == 0 || n%(i+2) == 0
    i += 6
  end
  return true
end

# when n is a prime
def circular_primes_of (n)
  res = [n]
  tmp = origin = n.to_s
  (origin.length-1).times do |i|
    tmp.concat(tmp[0]); tmp[0] = ''
    if prime? tmp.to_i then res << tmp.to_i else return nil end
  end
  res
end



# res = [2,5].to_set
# 3.upto(999999) do |i|
#   next if i.to_s =~ /[024568]/
#   if prime?(i) and not res.include?(i)
#     t = circular_primes_of(i)
#     res.merge t if t
#   end
# end
# p res


@F = {0=>'1', 1=>'3', 2=>'7', 3=>'9'}
def situation_of (num_of_digits = 1)
  res = Set.new
  0.upto(@F.size ** num_of_digits - 1) do |i|
    num_str = ''
    num_of_digits.times { num_str << @F[i%4]; i /= 4 }
    num = num_str.to_i
    if prime?(num) and not res.include?(num)
      t = circular_primes_of num
      res.merge t if t
    end
  end
  res
end

res = [2, 5, 7, 9].to_set
2.upto(6) { |digits|
  res.merge situation_of digits
}

p res

=begin
require "benchmark"
Benchmark.bmbm do |results|
  results.report("former:") {
    res = [2,5].to_set
    3.upto(999999) do |i|
      next if i.to_s =~ /[024568]/
      if prime?(i) and not res.include?(i)
        t = circular_primes_of(i)
        res.merge t if t
      end
    end
  }
  results.report("latter:") {
    res = [2, 5, 7, 9].to_set
    2.upto(6) { |digits|
      res.merge situation_of digits
    }
  }
end
=end