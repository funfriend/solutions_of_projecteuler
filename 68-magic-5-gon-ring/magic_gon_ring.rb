# !/bin/sh ruby

require "pp"
## starts from a line, say [g, a, b]
## choose c, judge h; choose d; judge i, and so forth

# current: [[a,b,c]...], left: [e1,e2,e3...]
def find_from(current, left)
  total = current[0].reduce(:+)
  if left.length == 3
    fejs = left.permutation(3).to_a.select { |f, e, j|
      t1 = f + e + current[0][1]
      t2 = e + j + current[-1][-1]
      t1 == t2 && t2 == total
    }
    fejs.empty? ? [] : fejs.map { |fej|
      f, e, j = fej
      current + [[j, current[-1][-1], e], [f, e, current[0][1]]]
    }
  else
    left.flat_map { |inner|
      outer = total - current[-1][-1] - inner
      if (left - [inner]).include?(outer)
        find_from(current + [[outer, current[-1][-1], inner]],
          left - [inner, outer])
      else
        []
      end
    }
  end
end


n = 5
numbers = (1..2*n).to_a

starts = (
  numbers.first(numbers.length/2).combination(2).flat_map { |a|
    numbers.last(numbers.length/2).combination(1).map { |b| a + b }
  } + numbers.first(numbers.length/2).combination(1).flat_map { |a|
    numbers.last(numbers.length/2).combination(2).map { |b| a + b }
  }).flat_map { |three|
    three.permutation(three.length).to_a.map { |e| [e] }
  }


pp starts.flat_map { |start|
  find_from(start, numbers - start[0])
}.map { |e|
  idx = e.index(e.min_by(&:first))
  (e[idx..-1] + e[0...idx]).map(&:join).join
}.uniq.sort
