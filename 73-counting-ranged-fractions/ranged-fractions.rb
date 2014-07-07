def ranged_fractions(from, to, limit)
  n = from.numerator + to.numerator
  d = from.denominator + to.denominator
  mediant = Rational(n, d)

  return 0 if d > limit

  1 + ranged_fractions(from, mediant, limit) +
      ranged_fractions(mediant, to, limit)
end

a = Rational(1, 3)
b = Rational(1, 2)
d = 12_000

p ranged_fractions(a, b, d)
