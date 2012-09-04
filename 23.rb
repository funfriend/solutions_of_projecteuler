#<target> should be > 1, Attention: it's not restrict sums, as it includes target self
def sum_divisors_of target
  return 1 if target == 1
  origin = target

  res = Hash.new
  largest_prime_factor = 2
  ## treat 2 specially
  if target%2 == 0
    target /= 2
    res[:'2'] = 1
    while target%2 == 0
      target /= 2
      res[:'2'] += 1
    end
  end
  ## treat 3 sqecially ...
  if target%3 == 0
    target /= 3
    res[:'3'] = 1
    while target%3 == 0
      target /= 3
      res[:'3'] += 1
    end
  end
  i = 5
  upper = Math.sqrt(target).floor
  until target == 1 || i > upper
    if target%i == 0
      res[i.to_s.to_sym] = 1
      target /= i
      while target%i == 0
        target /= i
        res[i.to_s.to_sym] += 1
      end
      upper = Math.sqrt(target).ceil
    end

    i += 2

    if target%i == 0
      res[i.to_s.to_sym] = 1
      target /= i
      while target%i == 0
        target /= i
        res[i.to_s.to_sym] += 1
      end
      upper = Math.sqrt(target).ceil
    end
    i += 4
  end
  res[target.to_s.to_sym] = 1 unless target == 1

  res.inject(1) { |mem, tuple| 
    mem * (tuple[0].to_s.to_i**(tuple[1]+1)-1)/(tuple[0].to_s.to_i-1) 
  }
end

=begin
perfect number: its proper divisors == n, that's its divisors == 2n
so deficient number and abundant number ...
=end

abundants = []
1.upto(28123) do |i|
  abundants.push i if sum_divisors_of(i) > 2*i
end

##here is the most time-consuming part
includes = Array.new(28123) { true }
0.upto(abundants.length - 1) do |i|
  i.upto(abundants.length - 1) do |j|
    break if (t = abundants[i] + abundants[j]) > 28123
    includes[t-1] = false
  end
end

res = 0
includes.each_index do |i|
  res += i+1 if includes[i]
end
puts res
