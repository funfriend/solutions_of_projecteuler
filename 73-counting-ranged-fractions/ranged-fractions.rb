def ranged_fractions(from, to, limit)
  queue = Array.new
  count = 0

  # seed the queue
  mediant = Rational(from.numerator + to.numerator, from.denominator + to.denominator)
  queue.push [from, mediant, to]

  until queue.empty?
    l, m, r = queue.shift # pop the queue
    unless m.denominator > limit
      count += 1
      # push the child to queue
      right_mediant = Rational(r.numerator + m.numerator, r.denominator + m.denominator)
      left_mediant  = Rational(l.numerator + m.numerator, l.denominator + m.denominator)
      queue.push [m, right_mediant, r], [l, left_mediant, m]
    end
  end

  count
end

a = Rational(1, 3)
b = Rational(1, 2)
d = 12_000

p ranged_fractions(a, b, d)
