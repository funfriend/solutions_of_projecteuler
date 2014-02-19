# see here for explaination: http://zh.wikipedia.org/wiki/%E8%BF%9E%E5%88%86%E6%95%B0
if __FILE__ == $0
  count = 0
  numerator = denominator = 1
  1000.times do |i|
    numerator, denominator =denominator, denominator + numerator
    numerator = numerator + denominator
    count += 1 if numerator.to_s.size > denominator.to_s.size
  end
  p count
end