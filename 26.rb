## conditions: dividend > divisor and both should be positive integer
require "benchmark"
def recurring_circle_of dividend, divisor=1 
  tmp_divisors = Hash.new
  cur_divisor = divisor
  pos = 0
  until cur_divisor == 0 || tmp_divisors.key?(cur_divisor)
    tmp_divisors[cur_divisor] = (pos+=1)
    cur_divisor = cur_divisor*10 % dividend
  end
  return 0 if cur_divisor == 0
  return tmp_divisors.size - tmp_divisors.values.index(tmp_divisors[cur_divisor])
end

max_length = 0
cur_num = 1
1.upto(999) { |i|
  l=recurring_circle_of i
  cur_num,max_length = i,l if l > max_length
}

puts cur_num, max_length