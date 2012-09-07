n, m = ARGV[0].to_i, ARGV[1].to_i

s = [1,2,5,10,20,50,100,200]
c = Array.new(n+1) { Array.new(m+1) }
#init
c[0].each_index do |i|
  c[0][i] = 1
end

1.upto(n) { |nn|
  c[nn][0] = 0
  1.upto(m) { |mm|
    # c[nn][mm] = c[nn][mm-1] + c[ nn-s[mm-1] ][mm]
    c[nn][mm] = ((nn-s[mm-1])<0 ? 0 : c[ nn-s[mm-1] ][mm]) + c[nn][mm-1]
  }
}
puts c[n][m]



# @s = [1,2,5,10,20,50,100,200]
# def self.count n, m
#   return 1 if n == 0
#   return 0 if n < 0
#   return 0 if n > 0 and m < 1
#   return count(n, m-1) + count(n-@s[m-1], m)
# end
# p count 200, 8