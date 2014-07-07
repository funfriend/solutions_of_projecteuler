def ranged_fractions(open, close, limit)
  n = open.numerator + close.numerator
  d = open.denominator + close.denominator
  mediant = Rational(n, d)

  return 0 if d > limit

  1 + ranged_fractions(open, mediant, limit) +
      ranged_fractions(mediant, close, limit)
end

a = Rational(1, 3)
b = Rational(1, 2)
d = 12_000

p ranged_fractions(a, b, d)
