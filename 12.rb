# the num of divisors
num = ARGV.empty? ? 500 : ARGV[0].to_i

start = (num/2)**2
while ( c = divisors_count_of(start += 1) ) <= 500
puts c, res

def divisors_count_of n
  res = Hash.new
end