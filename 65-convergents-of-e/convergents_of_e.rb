# !/bin/sh ruby

# continued fraction of e
cfe = (0..98).map { |i|
  q, r = (i+2).divmod(3)
  if r == 0
    q * 2
  else
    1
  end
}.unshift(2)

a100 = cfe.pop
hundredth = cfe.reverse_each.inject(Rational(1, a100)) { |mem, var| var + 1/mem }


numerator = hundredth.numerator
sum = 0
while numerator != 0
  sum += numerator%10
  numerator = numerator/10
end
p sum
