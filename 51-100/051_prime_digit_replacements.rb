require "prime"
module PrimeDigitReplacements
  class << self
    def search_in_digit_of(n)
      Range.new(10**(n-1), 10**n-1).each do |num|
        (1..n).each do |r|
          (1..n).to_a.combination(r).each do |bits|
            return [num, bits] if eight_out_of_family?(num, bits)
          end
        end
      end
      return nil
    end
    def eight_out_of_family?(num, bits)
      puts "#{num}, #{bits}"
      if bits.include?(1)
        composite_num = 0
        (1..9).each do |i|
          family_member = bits.inject(num.to_s) {|mem, var| mem[var-1] = i.to_s; mem}
          family_member = family_member.to_i
          composite_num += 1 unless family_member.prime?
          return false if composite_num > 1
        end
        composite_num == 1 ? true : false
      else
        composite_num = 0
        (0..9).each do |i|
          family_member = bits.inject(num.to_s) {|mem, var| mem[var-1] = i.to_s; mem}
          family_member = family_member.to_i
          composite_num += 1 unless family_member.prime?
          return false if composite_num > 2
        end
        composite_num == 2 ? true : false
      end
    end
  end
end

require "minitest/autorun"
class TestPrimeDigitReplacements < MiniTest::Unit::TestCase
  
end

if __FILE__ == $0
  p PrimeDigitReplacements.search_in_digit_of 5
end
