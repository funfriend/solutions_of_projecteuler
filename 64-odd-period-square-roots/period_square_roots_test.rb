require "./period_square_roots"
require "minitest/autorun"

class PeriodSquareRootsTest < MiniTest::Unit::TestCase
  def test_continued_fraction
    assert_equal([4,1,3,1,8], continued_fraction(23))
  end
end
