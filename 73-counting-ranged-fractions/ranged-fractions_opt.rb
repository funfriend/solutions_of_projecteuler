# according to that:
# if a/b, c/d, e/f are successive entry in n-th farey senquence, then
# e = floor((n+b)/d) * c - a
# f = floor((n+b)/d) * d - b
def next_farey(f1, f2, n)
  a, b = f1.numerator, f1.denominator
  c, d = f2.numerator, f2.denominator

  k = (n + b) / d
  e, f = k * c - a, k * d - b

  Rational(e, f)
end

a = Rational(1, 3)
succ = Rational(4000, 11999) # the successor of a, found by error-and-trail
b = Rational(1, 2)
d = 12_000

res = 0
while (t = next_farey(a, succ, d)) != b
  res = res + 1
  a, succ = succ, t
end

puts res
