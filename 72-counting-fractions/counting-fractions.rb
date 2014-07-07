d = 1_000_000
phi = Range.new(0, d).to_a

# upate phi[i*k] when meeting a prime 'i'
2.step(d) { |i|
  if phi[i] == i
    i.step(d, i) { |j| phi[j] = phi[j] / i * (i - 1) }
  end
}

# calculate the sum
res = phi.drop(2).reduce(:+)

p res
