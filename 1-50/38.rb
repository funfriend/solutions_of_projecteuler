#/usr/bin/ruby

def fit_pandigital?(str)
  return false unless str.length == 9
  return false if str.include?('0')
  return false if str =~ /([1-9]).*\1/
  return true
end


multiplicand = 1
cur_max = 0
while true
  str = "#{multiplicand}#{multiplicand*2}"
  n = 2
  break if str.length > 9

  while str.length < 10
    cur_max = str.to_i if fit_pandigital?(str) && str.to_i > cur_max

    n += 1; str = (0..n).inject("") { |mem, var| mem + "#{multiplicand*var}" }
  end
  multiplicand += 1
end

p cur_max