# known that 2/5 is the fraction immediately to the left of 3/7 when d = 8,
# we can use a theorem of farey sequence:
# if a/b < c/d, then their mediant (a+c)/(b+d) lies between them.

a, b = 2, 5
c, d = 3, 7

# iterate a, b until b is greater than 1,000,000
until b > 1_000_000
  a, b= a + c, b + d
end

# back a step to get the final answer
a = a - c
b = b - d

puts a, b # => 428570, 999997
