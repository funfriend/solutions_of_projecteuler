#!/usr/bin/ruby
require "benchmark"
puts Benchmark.measure {
  target = ARGV[0].to_i

  if target.nil? or target < 2
    puts 'please give a number (>1)'
    exit
  end

  largest_prime_factor = 2
  ## treat 2 specially
  if target%2 == 0
    largest_prime_factor = 2
    target /= 2
    while target%2 == 0
      target /= 2
    end
  end
  ## treat 3 sqecially ...
  if target%3 == 0
    largest_prime_factor = 3
    target /= 3
    while target%3 == 0
      target /= 3
    end
  end

  i = 5
  upper = Math.sqrt(target).ceil
  until target == 1 || i >= upper
    if target%i == 0
      largest_prime_factor = i
      target /= i
      while target%i == 0
        target /= i
      end
      upper = Math.sqrt(target).ceil
    end
    i += 2
    if target%i == 0
      largest_prime_factor = i
      target /= i
      while target%i == 0
        target /= i
      end
      upper = Math.sqrt(target).ceil
    end
    i += 4
  end

  if target == 1
    puts largest_prime_factor
  else
    puts target
  end

}
=begin
2 is the only even prime, so if we treat 2 separately we can increase factor with 2 every step
besides, every number n can at most have one prime factor greater than sqrt(n)

it can be faster, All primes greater than 3 can be written in the form 6k+/-1
=end
