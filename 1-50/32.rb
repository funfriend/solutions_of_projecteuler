=begin
multiplicand/multiplier/product
digits(product) = 4
digits(multiplicand) + digits(multiplier) = 5, thus 1-4 or 2-3
=end

def pandigital?(str)
  return false unless str.length == 9
  return false if str.include?('0')
  return false if str =~ /([1-9]).*\1/
  return true
end
res = []
1.upto(9) do |multiplicand|
  1234.upto(9876) do |multiplier|
    res << multiplier*multiplicand if pandigital?("#{multiplicand}#{multiplier}#{multiplier*multiplicand}")
  end
end

12.upto(98) do |multiplicand|
  123.upto(987) do |multiplier|
    res << multiplier*multiplicand if pandigital?("#{multiplicand}#{multiplier}#{multiplier*multiplicand}")    
  end
end

p res.uniq.inject(:+)
