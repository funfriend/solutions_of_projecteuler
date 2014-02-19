require "./cyclical_figurate_numbers"
require "minitest/autorun"

class FigurateNumbersTest < MiniTest::Unit::TestCase
  def setup
    @range = 1000...10000
  end

  def test_figurate_numbers
    POLYGONAL_TYPES.keys.each do |type|
      result = figurate_numbers type, @range
      m, n = result.first, result.last
      assert value(type, m.first) >= @range.min &&
             value(type, m.first - 1) < @range.min
      assert value(type, n.first) <= @range.max
             value(type, n.first - 1) > @range.max
    end
  end
end
