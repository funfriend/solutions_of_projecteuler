# encoding: utf-8
require "prime"
# initial
side_length, primes, diagonals = 3, 3, 5

until 10*primes < diagonals
  diagonal = side_length**2
  side_length += 2
  3.times do |i|
    diagonal += side_length-1
    primes += 1 if diagonal.prime?
  end
  diagonals += 4
end

puts "side_length: #{side_length}, primes/diagonals: #{primes}/#{diagonals}"