def isPrime? n
  return false if n<2
  return true if n==2 || n==3
  return false if n%2==0 || n%3==0
  i = 5
  lower = Math.sqrt(n).floor
  until i>lower
    return false if n%i==0 || n%(i+2)==0
    i+=6
  end
  return true
end

#whether a number can be written as the sum of a prime and twice a square.
def isFit? n
  bound = Math.sqrt(n/2+1).floor
  i = 1
  until i>bound
    return true if isPrime?(n-2*i*i)
    i+=1
  end
  return false
end



if __FILE__ == $0
  i = 35
  while true
    if !isPrime?(i) and !isFit?(i)
      p i
      break
    end
    i+=2
  end
end