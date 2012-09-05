res = {}
2.upto(100) { |a| 
  2.upto(100) { |b| res[a**b] = 0 } 
}

puts res