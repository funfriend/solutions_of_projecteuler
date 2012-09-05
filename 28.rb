def ans spiral_size
  return false if spiral_size%2 == 0
  cur, sum, s = 1, 1, 1
  while s < spiral_size
    s += 2
    4.times { sum += cur+=(s-1) }
  end
  sum
end

p ans ARGV[0].to_i

#but
#every circle: (x^2-3*x+3) + (x^2-2*x+2) + (x^2-x+1) + (x^2) = 4*x^2-6*x+6
#so ...
def ans2 spiral_size
  return false if spiral_size%2 == 0
  return 1 if spiral_size == 1
  sum = 1
  3.step(spiral_size, 2) { |x| sum += 4*x**2 - 6*x + 6 }
  sum
end

p ans2 ARGV[0].to_i

require "benchmark"
Benchmark.bmbm do |results|
  results.report("ans:") { p ans ARGV[0].to_i }
  results.report("ans2") { p ans2 ARGV[0].to_i }
end