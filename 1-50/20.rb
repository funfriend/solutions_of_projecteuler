#/usr/bin/ruby

res = [1]
1.upto(100) do |n|
  mem = 0
  res.each_index do |p|
    res[p], mem = (res[p]*n + mem)%10, (res[p]*n + mem)/10
  end

  while mem > 9
    res << mem%10
    mem /= 10
  end
  res << mem unless mem == 0
end

puts res.inject(:+)

=begin
similar with problem 16
=end