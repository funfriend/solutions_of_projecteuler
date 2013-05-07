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

  i = 3
  until target == 1
    if target%i == 0
      largest_prime_factor = i
      target /= i
      while target%i == 0
        target /= i
      end
    end
    i += 2
  end

  puts largest_prime_factor

}
=begin
2 is the only even prime, so if we treat 2 separately we can increase factor with 2 every step
TODO: besides, every number n can at most have one prime factor greater than sqrt(n)

=end
