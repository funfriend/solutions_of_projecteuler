require "./prime_pair_sets"
require "minitest/autorun"

class PrimePairSetsTest < MiniTest::Unit::TestCase
  def test_prime_pairs
    pairs = [3,7,109]
    assert(can_be_pairs?(673, pairs), "673 should be the set of [3,7,109]")
  end
end
