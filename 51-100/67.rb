require "benchmark"
p Benchmark.measure {
pre = [0]
File.open('67-triangle.txt').each do |line|
  cur = line.strip.split(/\s+/).collect { |e| e.to_i }
  cur[0] += pre[0]
  cur[-1] += pre[-1]
  1.upto(cur.length - 2) do | i |
    cur[i] += pre[i-1] > pre[i] ? pre[i-1] : pre[i]
  end
  pre = cur
end

puts pre.max
}