# helping function: sum digits in the integer `n`
def digit_sum(n)
  sum = 0
  until n == 0
    n, r = n.divmod(10)
    sum += r
  end
  sum
end

# help function: find the greatest digit which satisfies `x(20p+x) <= c`
def find_the_greatest_digit(p, c)
  # from the greatest digit
  guess = 9
  until guess * (20 * p + guess) <= c
    guess -= 1
  end
  guess
end

### sum the first `precision` digits of square root of `n`
### which should not be a square number
def square_root_digital_expansion(n, precision)
  # group the integer into pairs
  left = []
  until n == 0
    n, r = n.divmod(100)
    left.unshift r
  end
  # padding...
  pairs = left.concat Array.new(precision - left.length, 0)

  # init current value to zero
  c = 0
  remainder = p = x = 0

  pairs.each do |follow|
    c = 100 * remainder + follow
    x = find_the_greatest_digit(p, c)
    p, remainder = 10 * p + x, c - x * (20 * p + x)
  end

  digit_sum(p)
end

square_numbers = [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]
res = 1.upto(100).reduce(0) do |memo, i|
  memo += square_root_digital_expansion(i, 100) unless square_numbers.include?(i)
  memo
end
puts res
