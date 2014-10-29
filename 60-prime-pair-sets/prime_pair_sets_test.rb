require "./prime_pair_sets"
require "minitest/autorun"

class PrimePairSetsTest < MiniTest::Unit::TestCase
  def test_prime_pairs
    pair = []
    pairs = [3,7,109]
    assert(can_be_pairs?(3, pair), "3 should be pair of the set #{pair}")

    pair << 3
    assert(can_be_pairs?(7, pair), "7 should be pair of the set #{pair}")

    pair << 7
    assert(can_be_pairs?(109, pair), "109 should be pair of the set #{pair}")

    pair << 109
    assert(can_be_pairs?(673, pair), "673 should be pair of the set #{pair}")
  end

  def test_prime_pairs_another
    pair = []
    pairs = [13, 5197, 5701, 6733]
    assert(can_be_pairs?(13, pair), "13 should be pair of the set #{pair}")

    pair << 13
    assert(can_be_pairs?(5197, pair), "5197 should be pair of the set #{pair}")

    pair << 5197
    assert(can_be_pairs?(5701, pair), "5701 should be pair of the set #{pair}")

    pair << 5197
    assert(can_be_pairs?(6733, pair), "6733 should be pair of the set #{pair}")

    p pair
  end

end
