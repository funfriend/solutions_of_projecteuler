primes = [2,3,5,7,11,13,17]
res = 0
[0,1,2,3,4,5,6,7,8,9].permutation do |perm|
  next if perm[0] == 0
  fit = true
  i = 1
  until i>7
    num = perm[i]*100 + perm[i+1]*10 + perm[i+2]
    if num%primes[i-1] != 0
      fit = false; break
    end
    i+=1
  end
  res += perm.join('').to_i if fit
end

p res