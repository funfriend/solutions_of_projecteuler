# !/bin/sh ruby

## compute the periodic continued fractions of square root of a integer
## provide the integer, output the fractions
## use the method provided at
## http://en.wikipedia.org/wiki/Methods_of_computing_square_roots#Continued_fraction_expansion
def continued_fraction(n)
  a0 = Math.sqrt(n).floor
  cf = [a0]

  m = 0
  d = 1
  loop do
    m = d * cf.last - m
    d = (n - m**2)/d
    a = (a0 + m)/d
    cf << a

    break if a == 2 * a0
  end

  cf
end

p (1..10000).count { |i|
  Math.sqrt(i).floor**2 != i && continued_fraction(i).length%2 == 0
}
