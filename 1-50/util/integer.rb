module Util
  module Integer
    def prime?
      return false if self<2
      return true if self==2 || self==3
      return false if self%2==0 || self%3==0
      i = 5
      lower = Math.sqrt(self).floor
      until i>lower
        return false if self%i==0 || self%(i+2)==0
        i+=6
      end
      return true
    end
    
    def permutation_of?(n)
      arr_n = []
      until n == 0
        arr_n << n%10
        n /= 10
      end
      that = self
      arr_that = []
      until that == 0
        arr_that << that%10
        that /= 10
      end
      if arr_that.sort == arr_n.sort then true else false end
    end
  end
end