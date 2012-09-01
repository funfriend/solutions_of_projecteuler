#!/usr/bin/ruby
times = 1000

result = [1]

1.upto(times) do |step|
  mem = 0
  result.each_index do |i|
    result[i],mem = (mem+result[i]*2)%10, (mem+result[i]*2)/10
  end
  result << mem unless mem == 0
end

puts result.inject { |mem, var| mem += var }

=begin
It's a little easy ...
=end
