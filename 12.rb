#!/usr/bin/ruby
# the num of divisors

# return: number of divisors for <target>, if target < 2, nil is returned 
def divisors_num_of target
  if target.nil? or target < 2
    puts 'please give a number (>1)'
    return nil
  end

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

  res.inject(1) { |mem, tuple| mem*(tuple[1]+1) }
end

num = ARGV.empty? ? 500 : ARGV[0].to_i

n = 2
until ( c = divisors_num_of n*(n+1)/2 ) > num
  n += 1
end

puts c, n*(n+1)/2


=begin
prime divisors referring to Problem_3:(the largest prime divisor of a number)
=end
