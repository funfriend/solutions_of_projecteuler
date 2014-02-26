require "./magic_gon_ring"
require "minitest/autorun"

class MagicGonRingTest < MiniTest::Unit::TestCase
  def test_find_from
    current = [[4,3,2]]
    left = [1,6,5]
    assert_equal [[4,3,2],[6,2,1],[5,1,3]], find_from(current, left)
  end
end
