=begin
every Hexagonal number is Triangle number
=end
def isPentagonalNumber?(num)
  t = (Math.sqrt(24*num+1)+1)/6
  if t == t.to_i then true else false end
end
n = 144
while true
  if isPentagonalNumber? n*(2*n-1)
    puts n*(2*n-1)
    break
  end
  n+=1
end