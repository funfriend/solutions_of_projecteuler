POLYGONAL_TYPES = {
  triangle: 3,
  square: 4,
  pentagonal: 5,
  hexagonal: 6,
  heptagonal: 7,
  octagonal: 8
}

def value(type, n)
  (POLYGONAL_TYPES[type] - 2) * n * (n - 1) /2 + n
end

def figurate_numbers(type, between = 1000...10000)
  a = POLYGONAL_TYPES[type.to_sym] - 2
  x = (2.0/a * between.min + (0.5 - 1.0/a)**2)**0.5 + (0.5 - 1.0/a)
  m = x.ceil
  x = (2.0/a * between.max + (0.5 - 1.0/a)**2)**0.5 + (0.5 - 1.0/a)
  n = x.floor
  (m..n).map { |e| value(type, e) }
end

# params:
# found: [:type, number]

def find_set_from(found)
  prev = found.last.last
  left_types = POLYGONAL_TYPES.keys - found.map(&:first)
  # judge the last with the first, when linked number got
  if left_types.empty?
    if found.first.last/100 == found.last.last%100
      return [found]
    else
      return []
    end
  end

  nexts = (POLYGONAL_TYPES.keys - found.map(&:first)).flat_map { |type|
    figurate_numbers(type).select { |e| e/100 == prev%100 }.map { |e| [type, e] }
  }
  return [] if nexts.empty?

  nexts.flat_map { |e| find_set_from found[0..-1].push(e) }
end


if __FILE__ == $0
  result = figurate_numbers(:triangle).flat_map { |e|
    find_set_from [[:triangle, e]]
  }

  p result.first.map(&:last).reduce(&:+)
end
