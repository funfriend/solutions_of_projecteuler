def fibonacci length
  pre = 1
  cur = 1
  i = 2
  until cur.to_s.length == length
    pre, cur = cur, pre+cur
    # puts cur
    i += 1
  end
  puts i
end

fibonacci 1000
#another way, always be true ...
n = (999  + Math.log10(Math.sqrt 5)) / (Math.log10 (1 + Math.sqrt(5))/2)
puts n.ceil

# 10.upto(100) { |i|
#   fibonacci i
#   puts n = (i-1 - Math.log10(0.9) + Math.log10(Math.sqrt 5)) / (Math.log10 (1 + Math.sqrt(5))/2)
# }