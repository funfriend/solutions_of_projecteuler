class Integer
  def last_ten_digits_of_pow_self
    result = 1
    self.times { |i|
      result = (result*self)%(10**10)
    }
    result
  end
end

res = 0
1.upto(1000) do |i|
  res = (res + i.last_ten_digits_of_pow_self)%(10**10)
end
p res

# require "test/unit"
# class Test48 < Test::Unit::TestCase
#   def test_last_ten_digits_of_pow_self
#     assert_equal(256, 4.last_ten_digits_of_pow_self)
#   end
# end