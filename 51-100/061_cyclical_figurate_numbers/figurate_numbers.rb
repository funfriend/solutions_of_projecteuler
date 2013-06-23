module FigurateNumbers
  @polygonal_types = {
    triangle: 3, square: 4, pentagonal: 5,
    hexagonal: 6, heptagonal: 7, octagonal: 8
  }
  class << self
    attr_accessor :polygonal_types
    def value(polygonal_type, n)
      n + (@polygonal_types[polygonal_type]-2)*n*(n-1)/2
    end
    # options:
    # => at: Integer > 0
    # => between: Range
    def values(polygonal_type, options={})
      unless @polygonal_types.key?(polygonal_type)
        raise 'an invalid value of polygonal_type'
      end
      at = options[:at]
      if at and at.instance_of?(Integer)
        raise 'an invalid value of :at option' if at < 1
        return at + (@polygonal_types[polygonal_type]-2)*at*(at-1)/2
      end
      between = options[:between]
      if between and between.instance_of?(Range)
        a = @polygonal_types[polygonal_type]-2
        x = (2.0*between.min/a+(0.5-1.0/a)**2)**0.5 + (0.5-1.0/a)
        min = x.ceil
        x = (2.0*between.max/a+(0.5-1.0/a)**2)**0.5 + (0.5-1.0/a)
        max = x.floor
        (min..max).reduce([]) { |mem, var| mem << value(polygonal_type, var) }
      end
    end

    def between(left=1000, right=10000, options={})
      if options[:only] and options[:except]
        raise 'only one option can be choosed from :only and :except'
      end
      only = options[:only]
      options[:except] ||= []
      only ||= @polygonal_types.keys - options[:except]
      only.reduce({}) do |mem, type|
        mem[type] = values(type, between: left..right)
        mem
      end
    end
  end
end

require "minitest/autorun"
class TestFigurateNumbers < MiniTest::Unit::TestCase
  def setup
    FigurateNumbers.polygonal_types = { triangle: 3, square: 4, pentagonal: 5 }
  end
  def test_values_between
    assert_equal([1,3,6,10,15], FigurateNumbers.values(:triangle, between: 1..15))
  end
  def test_between_all
    assert_equal({
      triangle: [1,3,6,10,15],
      square: [1,4,9],
      pentagonal: [1,5,12]
      }, FigurateNumbers.between(1, 15))
  end
end

def find_left(a=0, search_space)
  res = []
  search_space.each do |key, candidates|
    candidates.each do |candidate|
      b = candidate%100
      next if b < 10
      res.push [key, v]
      left_space = FigurateNumbers.between(b*100, b*100+99, except: res.map(&:first))
      # find_left(res, next_space)
    end
  end
end
if __FILE__ == $0
  res = []
  triangles = FigurateNumbers.values(:triangle, between: 1000..2000)
  triangles.each do |t|
    a, b = t/100, t%100
    next if b < 10
    res.push [:triangle, t]
    candidates = FigurateNumbers.between(b*100, b*100+99, except: res.map(&:first))
    p candidates
    candidates.each do |key, values|
      values.each do |v|
        c = v%100
        next if c < 10
        res.push [key, v]
      end
    end
  end
end