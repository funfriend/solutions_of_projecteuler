# def max_digits
#   i = 1
#   i+=1 until 9**i > 8*i*9**5 + 1

#   i-1 
# end
# puts max_digits

res = []
2.upto(354294) do |i|
  # res << i if i == i.to_s.scan(/\d/).inject(0) {|mem, var| mem += var.to_i**5 }
  mem, t = 0, i
  until t < 10
    mem += (t%10)**5
    t /= 10
  end
  res << i if mem + t**5 == i
end

p res.inject(:+)