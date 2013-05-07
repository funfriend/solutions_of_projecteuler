#encoding: utf-8
# assume n > 1
# def prime_factors_of(n, &block)
#   result = {}
  
#   ## for factor=2
#   n, times = block.call n, 2
#   result[2] = times if times != 0
#   return result if n == 1
#   ## for factor=3
#   n, times = block.call n, 3
#   result[3] = times if times != 0
#   return result if n == 1
#   ## for factor = 6*n +/- 1
#   factor = 5
#   lower = Math.sqrt(n).floor
#   until factor > lower
#     n, times = block.call n, factor
#     result[factor], lower = times, Math.sqrt(n).floor if times != 0

#     n, times = block.call n, factor+2
#     result[factor+2], lower = times, Math.sqrt(n).floor if times != 0

#     factor += 6
#   end
#   result[n] = 1 if n != 1
#   return result
# end

# proc = lambda { |n, factor|
#   times = 0
#   until n%factor != 0
#     n /= factor
#     times += 1
#   end
#   [n, times]
# }

# if __FILE__ == $0
#   n = 30
#   i = 0
#   while i != 4
#     if prime_factors_of(n, &proc).size == 4
#         i += 1
#     else
#       i = 0
#     end
#     n += 1
#   end
#   p n-4
# end

class Integer
  def do_factor_on(factor)
    n = self
    n/=factor until n%factor != 0
    n
  end

  def num_of_prime_factors
    n = self
    result = 0
    
    ## for factor=2
    tmp_n = n.do_factor_on(2)
    result, n = result+1, tmp_n unless tmp_n == n
    return result if n == 1

    ## for factor=3
    tmp_n = n.do_factor_on(3)
    result, n = result+1, tmp_n unless tmp_n == n
    return result if n == 1

    ## for factor = 6*n +/- 1
    factor = 5
    lower = Math.sqrt(n).floor
    until factor > lower
      [factor, factor+2].each do |f|
        tmp_n = n.do_factor_on(f)
        unless tmp_n == n
          result += 1
          n = tmp_n
          lower = Math.sqrt(n).floor
        end
      end
      factor += 6
    end
    result+=1 if n != 1
    return result
  end
end

if __FILE__ == $0
  # p ARGV[0].to_i.num_of_prime_factors
  n = 2*3*5*7
  i = 0
  while i != 4
    if n.num_of_prime_factors == 4 then i+=1 else i=0 end
    n += 1
  end
  p n-4
end