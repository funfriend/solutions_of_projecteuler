# !/bin/sh ruby

## according to http://mathworld.wolfram.com/PellEquation.html
## if (x, y) is a solution to the equation (x^2 - D*y^2 = 1)
## then x/y is a fraction convergent of the square root of D.

## a method copied from solution 64
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

def min_xy_when(d)
  # compute continued fractions of square root of d
  cfs = continued_fraction(d)
  # compute convergent one by one
  # until finding out an answer which is a square number
  p, q = 0, 1
  pp, qq = 1, 0
  idx = 0
  loop do
    a = cfs[idx]

    p, pp = pp, a * pp + p
    q, qq = qq, a * qq + q
    return [pp, qq] if pp**2 == d * qq**2 + 1

    idx = idx % (cfs.length - 1) + 1
  end
end


puts (1..1000).select { |e|
  Math.sqrt(e).floor**2 != e
}.map { |d|
  p d
  [d, min_xy_when(d)]
}.max_by { |o| o.last.first }
