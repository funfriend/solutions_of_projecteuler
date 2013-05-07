require "./util/prime"
N = 1_000_000
primes = Prime.sieve_eratosthenes N

first, last, sum = 0, 0, primes[0]
until sum > primes.last
  sum += primes[last+=1]
end

# p first, last, sum

found = false
while true
  if found
    break
  else
    last = last - first - 1
    first = 0
    sum = primes[first..last].inject(:+)
  end

  until sum > primes.last
    if Prime.prime? sum
      found = true
      break
    else
      last += 1
      sum += (primes[last] - primes[first])
      first += 1
    end
  end
end

p first, last, primes[first..last].inject(:+)