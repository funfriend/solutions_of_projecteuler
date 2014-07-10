l = 150_0000

cache = Hash.new
(2..Math.sqrt(l/2).floor).each do |m|
  (1...m).each do |n|
    if m.gcd(n) == 1 && (m-n).odd?
      # calculate (a, b, c)
      a, b, c = m**2 - n**2, 2 * m * n, m**2 + n**2
      d = base = a + b + c
      until d > l
        # update cache
        cache[d] ||= 0
        cache[d] += 1
        d += base
      end
    end
  end
end

puts cache.count { |k ,v| k <=l && v == 1 }
