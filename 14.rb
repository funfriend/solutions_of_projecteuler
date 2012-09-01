#!/usr/bin/ruby

def length_of_chain_when start
  tmp = {}
  res = 1
  until start == 1
    if start % 2 == 0
      start /= 2
    else
      start = start*3 + 1
    end
    res += 1
  end
  res
end

s = ARGV.empty? ? 999999 : ARGV[0].to_i

res = 1, 1

1.upto(s) do |i|
  l = length_of_chain_when(i)
  res = i, l if l >= res[1]
end

puts res


=begin
However, it can be improved, if we save value when calculating <length_of_chain_when>
=end
