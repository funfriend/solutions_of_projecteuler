#!/usr/bin/ruby

=begin
C(40, 20)
=end
require "benchmark"
def combination(a, b)
  (0...b).inject(1) { |mem, var| mem *= (a-var).to_f/(var+1) }
end

#TODO: something wrong with it
def combination_(a,b)
  tmp = Array.new(a+1) { |index| Array.new(b+1) }
  tmp.each_index do |i|
    tmp[i].each_index do |j|
      tmp[i][j] = 1 if j == i
      tmp[i][j] = j==0 ? 1 : (tmp[i-1][j]+ tmp[i-1][j-1]) if j < i
    end
  end
  tmp[a][b]
end


Benchmark.bmbm do |results|
  results.report("origin:") { puts combination 40, 20 }
  results.report("changed:") { puts combination_ 40, 20 }  
end

=begin
<combination_> is much slower than <combination>
=end
