require "./totient_maximum"
require "minitest/autorun"

class TotientMaximumTest < MiniTest::Unit::TestCase
  def test_totient_maximum
    assert prime_factors(2) == {2 => 1}
    assert prime_factors(4) == {2 => 2}
    assert prime_factors(11) == {11 => 1}
    assert prime_factors(18) == {2 => 1, 3 => 2}
  end
end
