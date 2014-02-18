# !/bin/sh ruby

## use recurrence relations,
## see http://mathworld.wolfram.com/ContinuedFraction.html for details.
def convergents(cf)
  p, q = 0, 1
  pp, qq = 1, 0
  cf.map { |e|
    p, pp = pp, e * pp + p
    q, qq = qq, e * qq + q
    Rational(pp, qq)
  }
end

# continued fraction of e
cfe = (0..98).map { |i|
  q, r = (i+2).divmod(3)
  if r == 0
    q * 2
  else
    1
  end
}.unshift(2)


cs = convergents(cfe)

numerator = cs[99].numerator
sum = 0
while numerator != 0
  sum += numerator%10
  numerator = numerator/10
end
p sum
