require "./prime_digit_replacements"
require "minitest/autorun"
class PrimeDigitReplacementsTest < MiniTest::Unit::TestCase
  def test_replacement_pattern
    p replacement_patterns_of("56663")
  end
end
