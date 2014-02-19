module LychrelNumbers
  Integer.class_eval do
    define_method :palindromic? do
      return false if self < 0
      self == self.to_s.reverse.to_i
    end
  end
  class << self
    def lychrel(n)
      return false if n < 0
      tmp = []
      i = (1..50).find do |i|
        tmp << reverse(n) if reverse(n) < 10000
        n = n + reverse(n)
        if n.palindromic? then true else tmp << n if n < 10000; false end
      end
      tmp << (i ? false : true)
    end

    private
    def reverse(n)
      n.to_s.reverse.to_i
    end
  end
end

if __FILE__ == $0
  # intialize all as palindromic
  flags = Array.new(10000, false)
  (0..9999).each do |i|
    res = LychrelNumbers.lychrel(i)
    flag = res.pop
    res.each { |i| flags[i] = flag } if flag
  end
  p flags.count(true)
end

require "minitest/autorun"
class TestLychrelNumbers < MiniTest::Unit::TestCase
  def test_palindromic
    0.palindromic? and not 10.palindromic? and 11.palindromic? and
    not -1.palindromic?
  end
  def test_lychrel
    assert_equal([0, false], LychrelNumbers.lychrel(0), '0 should not be lychrel')
    assert_equal([1, false], LychrelNumbers.lychrel(1), '1 should not be lychrel')
    assert_equal([21, false], LychrelNumbers.lychrel(12), '12 should not be lychrel')
    assert_equal(true, LychrelNumbers.lychrel(196).last, '196 should be lychrel')
  end
end