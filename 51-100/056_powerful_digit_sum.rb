module PowerfulDigitSum
  Integer.class_eval do
    define_method :digit_sum do
      n = self.abs
      res = 0
      until n == 0
        res += n%10
        n /= 10
      end
      res
    end
  end
end

require "minitest/autorun"
class TestPowerfulDigitSum < MiniTest::Unit::TestCase
  def test_digit_sum
    assert_equal(10, 1234.digit_sum, 'digit sum of 1234 should be 10')
    assert_equal(10, -1234.digit_sum, 'digit sum of -1234 should be 10')
  end
end

if __FILE__ == $0
  max_digit_sum = 0
  (1..99).each do |a|
    (1..99).inject(1) do |mem, var|
      mem *= a
      max_digit_sum = [max_digit_sum, mem.digit_sum].max
      mem # IMPORTANT! remember return this
    end
  end
  p max_digit_sum
end