def num_solutions_of p
  res = 0
  1.upto(p/3) { |a|
    b,left = (p*p-2*a*p)/(2*p-2*a), (p*p-2*a*p)%(2*p-2*a)
    res += 1 if left == 0 && b > a
  }
  res
end

require "benchmark"
p Benchmark.measure {
cur_value = 0
max_solutions = 0
1000.downto(12) do |i|
  t = num_solutions_of i
  cur_value, max_solutions = i, t if t > max_solutions
end
}

p cur_value, max_solutions