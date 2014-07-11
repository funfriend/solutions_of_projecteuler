### integer partition
# base: p(0) = 1, p(n) = 0 where n < 0
# p(n) = p(n-1) + p(n-2) - p(n-5) - p(n-7) + (-1)^(|i|) * p(n - i(3i-1)/2)
# where i = 0, 1, -1, 2, -2, ....

d = 100
parts = Array.new(d, 0)
parts.unshift(1) # one element for p(0)

generalized_pentagonal_number = lambda { |i|
  [i.even? ? 1 : -1, i * (3*i - 1)/2]
}


1.upto(d) do |n|
  i = 0
  loop do
    i += 1

    sign, q = generalized_pentagonal_number.call(i)
    break if q > n
    parts[n] -= sign * parts[n - q]

    sign, q = generalized_pentagonal_number.call(-i)
    break if q > n
    parts[n] -= sign * parts[n - q]
  end
end

puts parts.last
