@primes = [2,3,5,7,11,13,17]
@res = 0
def func a, start, last
  if start == last
   @res += a.join('').to_i if (a[start-2]*100+a[start-1]*10+a[start])%(@primes[start-3]) == 0
  end
  (start==0 ? (start+1) : start).upto(last) do |i|
    a[start], a[i] = a[i], a[start]
    if start < 3 || (a[start-2]*100+a[start-1]*10+a[start])%(@primes[start-3]) == 0
      func a, start+1, last
    end
    a[start], a[i] = a[i], a[start]
  end
end

func [0,1,2,3,4,5,6,7,8,9], 0, 9

p @res