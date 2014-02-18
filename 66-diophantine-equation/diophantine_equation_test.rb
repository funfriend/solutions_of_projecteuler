require "./diophantine_equation"
require "minitest/autorun"

class DiophantineEquationTest < MiniTest::Unit::TestCase
  def test_diophantine_equation
    assert_equal([9,4], min_xy_when(5))
  end
end
