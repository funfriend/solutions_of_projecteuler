#formula
#S(n) = (1+(9n-1)10^n)/9

# n>=0
def s(n)
  ((9*n-1)*(10**n)+1)/9
end

def get_digits_num_of pos
  n = 0
  until s(n) > pos
    n+=1
  end
  n
end

(0..6).each do |i|
  pos = 10**i
  digits = get_digits_num_of pos
  d,l = (pos-s(digits-1))/digits, (pos-s(digits-1))%digits
  d,l = d-1, digits if l == 0
  
  num = 10**(digits-1) + d
  p num.to_s[l-1]
end

