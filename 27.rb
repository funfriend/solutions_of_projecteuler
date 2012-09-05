=begin
f(n) = n^2 + a*n + b
when n = 0, f(0) = b is prime
when n = 1, f(1) = a+b+1 is prime
when n = k, f(k) = k*a + b+k^2 is prime
=end
def is_prime?(n)
  return false if n < 2
  return true if n == 2 || n == 3
  return false if n%2 == 0 || n%3 == 0
  return true if n < 9
  upper = Math.sqrt(n).floor
  factor = 5
  until factor > upper
    return false if n%factor == 0 || n%(factor+2) == 0
    factor += 6
  end
  return true
end

def quadratic n, a, b
  n**2 + a*n + b
end

max_length = 0
a_b = [0,0]
2.upto(999) do |b|
  next unless is_prime?(b)
  (2-b).upto(999) do |a|
    i = 0
    i+=1 while is_prime?(quadratic(i,a,b))
    max_length, a_b =i, [a,b] if i > max_length
  end
end

p a_b, max_length
