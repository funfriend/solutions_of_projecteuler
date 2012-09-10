
def prime? n
  return false if n < 2
  return true if n == 2 || n == 3
  return false if n%2 == 0 || n%3 == 0
  
  i = 5
  lower = Math.sqrt n
  until i > lower
    return false if n%i == 0 || n%(i+2) == 0
    i += 6
  end
  return true
end


=begin
for god's sake ...
1+2+3+4+5+6+7+8+9=45 => always dividable by 3
1+2+3+4+5+6+7+8=36 => always dividable by 3
=end

res = nil
7.downto(1) do |i|
  a = (1..i).to_a.reverse
  # here the order is from big to small ...
  # However, we shouldn't assume that.
  a.permutation do |perm|
    num = perm.join('').to_i
    if prime?(num) then res = num; break end
  end
  break if res
# so if you want to change, change it to this
=begin
  a.permutation do |perm|
    num = perm.join('').to_i
    if prime?(num) then res = (res.nil? || num > res) ? num : res end
  end
  break if res
=end
end

p res




=begin
TODO:全排列实现
=end
# def permutation_of(a)
#   a.sort!

# end