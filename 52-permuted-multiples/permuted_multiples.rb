module PermutedMultiples
  class << self
    def same_digits?(a, b, *args)
      ordered_digits = a.to_s.each_char.to_a.sort
      return false unless b.to_s.each_char.to_a.sort == ordered_digits
      args.each do |arg|
        return false unless arg.to_s.each_char.to_a.sort == ordered_digits
      end
      return true
    end
    def first_qualified_digit_of(n_bits)
      start = 10**n_bits
      up = start*10/6
      start.upto(up) do |i|
        return i if same_digits?(i, 2*i, 3*i, 4*i, 5*i, 6*i)
      end
      nil
    end
  end
end
if __FILE__ == $0
  n = 2
  result = nil
  until result
    result = PermutedMultiples.first_qualified_digit_of n
    n += 1
  end
  puts result
end

require "minitest/autorun"
class TestPermutedMultiples < MiniTest::Unit::TestCase
  def setup
    @a = 123456
    @b = 145623
    @c = 134256
    @d = 122356
  end
  def test_a_and_b_has_same_digits
    PermutedMultiples.same_digits? @a, @b
  end
  def test_a_and_d_has_diff_digits
    PermutedMultiples.same_digits? @a, @d
  end
  def test_a_and_b_and_has_same_digits
    PermutedMultiples.same_digits? @a, @b, @c
  end
end