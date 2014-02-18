# !/bin/sh ruby

count = 0

i = 1
loop do
  lower = 10**(i - 1)
  m = (lower**(1.0/i)).ceil

  break if m > 9

  count += 9 - m + 1

  i += 1
end

puts count
