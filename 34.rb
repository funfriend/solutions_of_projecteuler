require "benchmark"
@f = {0 => 1}
(1..9).inject(1) { |mem, var| mem *= var; @f[var] = mem }

def sum_of_factorials_digits n
  return nil if n < 0
  res = 0
  until n == 0
    res += @f[n%10]
    n /= 10
  end
  res
end

Benchmark.bm do |x|
  x.report {
    res = []
    10.upto(@f[9]*7) { |i|
      res << i if sum_of_factorials_digits(i) == i
    }
    p res
  }
end