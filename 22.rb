# p File.read("22-names.txt")
names = nil
eval("names = [#{File.read("22-names.txt")}].sort")
# puts names
scores = 0
names.each_index do | i |
  point = 0
  names[i].each_codepoint { |c| point += (c-64)}
  scores += (i+1) * point
end

puts scores