=begin
model:
xy/yz = x/z (0< x,y,z < 9)
(10*x + y) / (10*y + z) = x/z
thus, 9xz + yz = 10xy
=end

11.upto(99) do |i|
  x, y = i/10, i%10
  next if y==0
  z = 10*x*y / (9*x+y).to_f
  puts "#{x},#{y},#{z.to_i}" if z.to_i == z and (y*10+z.to_i) > i
end

=begin
result:
1,6,4
1,9,5
2,6,5
4,9,8

answer = 100
=end


