require "benchmark"
Benchmark.bmbm do |x|
  x.report {
digits = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

num = ARGV[0].to_i - 1
i = 10
until (i-=1) == 0
  factor = (1..i).inject(1, :*)
  a, num = num/factor, num%factor
  print digits.delete_at(a)
end
puts digits.first
}
end
