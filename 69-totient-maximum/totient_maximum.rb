# !/bin/sh ruby

## see http://mathworld.wolfram.com/TotientFunction.html
## for the math solution

def prime_factors(n)
  factors = Hash.new { |hash, key| hash[key] = 0 }

  while n%2 == 0
    factors[2] += 1
    n = n/2
  end

  while n%3 == 0
    factors[3] += 1
    n = n/3
  end

  i = 1
  while n > 1 && (6*i - 1)**2 <= n
    while n%(6*i-1) == 0
      factors[6*i-1] += 1
      n = n/(6*i-1)
    end
    while n%(6*i+1) == 0
      factors[6*i+1] += 1
      n = n/(6*i+1)
    end
    i += 1
  end

  factors[n] += 1 if n != 1

  factors
end



p (2..1_000_000).map { |n|
  ps = prime_factors(n).keys
  Rational(ps.reduce(:*),
               ps.reduce(1) {|mem, p| mem * (p-1) })
}.each_with_index.max_by(&:first).last + 2


### in fact, 2*3*5*7*11*13*17 is the answer
