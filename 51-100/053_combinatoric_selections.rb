=begin
for certain n in C(n, r), if we find samllest r, such that C(n, r) >= LIMIT, then we
can get n-r-r+1 values that are greater than LIMIT.examples:
GIVEN LIMIT = 1,000,000; n = 23
THEN r = 10 is the smallest r that make C(n, r) >= LIMIT.
for n = 23, we get 23-10-10+1 = 4 values making C(n,r)>=LIMIT
=end

module CombinatoricSelections
  class << self
    def set_total(n)
      @n = n
    end
    def num_of_selections_when(limit)
      sum = 1
      r = (1..@n/2).find { |r| sum = sum*(@n-r+1)/r; sum >= limit }
      return @n-2*r+1 if sum >= limit
      return 0
    end
  end
end

if __FILE__ == $0
  reduce = Proc.new do |n, i|
    CombinatoricSelections.set_total i
    n += CombinatoricSelections.num_of_selections_when 1000000
  end
  p (23..100).reduce(0, &reduce)
end

require "minitest/autorun"
class TestCombinatoricSelections < MiniTest::Unit::TestCase
  def setup
    CombinatoricSelections.set_total 23
  end
  def test_num_of_selections_when
    4 == CombinatoricSelections.num_of_selections_when(1000000)
  end
end