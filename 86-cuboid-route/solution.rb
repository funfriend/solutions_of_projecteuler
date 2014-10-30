def pythagoreans_for(m)
  2.upto(2 * m).select { |x|
    t = x * x + m * m
    Math.sqrt(t).to_i**2 == t
  }.map { |ab_sum|
    count(ab_sum, m)
  }.reduce(0, :+)
end

def count(ab_sum, c)
  if ab_sum <= c
    ab_sum / 2
  else
    (2 * c - ab_sum) / 2 + 1
  end
end

def solutions_for(limit)
  count = 0
  i = 0
  until count > limit
    i += 1
    count += pythagoreans_for(i)
  end
  i
end

puts solutions_for(1_000_000) if __FILE__ == $PROGRAM_NAME
