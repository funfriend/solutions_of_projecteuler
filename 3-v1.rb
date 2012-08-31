#!/usr/bin/ruby
require "benchmark"
puts Benchmark.measure {
  target = ARGV[0].to_i

  if target.nil? or target < 2
    puts 'please give a number (>1)'
    exit
  end

  largest_prime_factor = 2
  i = 2
  until target == 1
    if target%i == 0
      largest_prime_factor = i
      target /= i
      while target%i == 0
        target /= i
      end
    end
    i += 1
  end

  puts largest_prime_factor
}
=begin
TODO: 2 is the only even prime, so if we treat 2 separately we can increase factor with 2 every step
=end
