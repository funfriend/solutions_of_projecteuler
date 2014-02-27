# !/bin/sh ruby

require "prime"
## see http://mathworld.wolfram.com/TotientFunction.html
## for the math solution

## the more and the samller prime factors a number has, the bigger n/phi(n) is.

res = 1
pg = Prime.each
res = t until (t = res*pg.next) >= 1_000_000

p res

### in fact, 2*3*5*7*11*13*17 is the answer
