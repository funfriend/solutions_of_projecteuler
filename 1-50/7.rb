#!/usr/bin/ruby
require "benchmark"
target = ARGV.empty? ? 10001 : ARGV[0].to_i

def is_prime? n
  return false if n < 2
  return true if n == 2 || n == 3
  return false if n%2 == 0
  return false if n%3 == 0

  factor = 5
  lower = Math.sqrt(n).floor
  until factor > lower
     return false if n%factor == 0
     return false if n%(factor+2) == 0
     factor += 6
   end
   return true
end

def prime_improved n
  return nil if n < 1
  return 2 if n == 1
  return 3 if n == 2
  
  n -= 2
  res = 1
  until n == 0
    res += 4
    n -= 1 if is_prime?(res)
    n -= 1 if n!=0 && is_prime?(res+=2)
  end

  res
end

def prime n
  res = 1
  until n == 0
    n -= 1 if is_prime?(res+=1)
  end
  res
end

Benchmark.bmbm do |results|
  results.report("origin:") { puts prime target }
  results.report("improved:") { puts prime_improved target}
end

=begin
after comparison, <prime_improved> actually not so improved ...
=end
