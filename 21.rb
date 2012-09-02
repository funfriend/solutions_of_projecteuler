dealed = Array.new(10000,false)

#<target> should be > 1, Attention: it's not restrict sums, as it includes target self
def sum_divisors_of target
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

res = 0
2.upto(dealed.length - 1) do | i |
  if !dealed[i]
    t = sum_divisors_of(i) - i
    if t!=i && sum_divisors_of(t) == t+i
      res += (t+i)
    end
    dealed[i] = dealed[t] = true
  end
end
puts res

