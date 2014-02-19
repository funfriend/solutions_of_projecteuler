require "./cubic_permutations"
require "minitest/autorun"

class CubicPermutationsTest < MiniTest::Unit::TestCase
  def test_digits_of
    assert_equal [1,1,1,1,1,1,1,1,1,2], digits_of(90123456789)
  end

  ## the test is show that
  ## the permutation operation is time-consuming for long-digit number.
  # def test_only_five_cubes
  #   cube = 127035954683
  #   assert(only_five_cubes?(cube.to_s.each_char.to_a), "Failure message.")
  # end
end
