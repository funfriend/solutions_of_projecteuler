def prime?(n)
  return false if n < 2
  return true if n == 2 || n == 3
  return false if n%2 == 0 || n%3 == 0
  i = 5
  lower = Math.sqrt n
  until i > lower
    return false if n%i == 0 || n%(i+2) == 0
    i += 6
  end
  return true
end

def left_truncatable_primes_based_on left
  next_left = []
  left.each do | left_prime |
    (1..9).each do |i|
      next_left << "#{i}#{left_prime}".to_i if prime?("#{i}#{left_prime}".to_i)
    end
  end
  next_left
end

def right_truncatable_primes_based_on right
  next_right = []
  right.each do |right_prime|
    [1,3,7,9].each do | i |
      next_right << right_prime*10+i if prime?(right_prime*10+i)
    end
  end
  next_right
end


left = [2,3,5,7]
right = [2,3,5,7]
res = []
=begin
until left.empty? or right.empty?
  res.concat left & right
  left = left_truncatable_primes_based_on left
  right = right_truncatable_primes_based_on right
end
=end
# but now that we know only 11 double-truncatable primes exist
# then ...

until res.size == 15
  res.concat left & right
  left = left_truncatable_primes_based_on left
  right = right_truncatable_primes_based_on right
end

p res