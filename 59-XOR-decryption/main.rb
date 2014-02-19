encrypted_values = File.open("cipher1.txt", "r").read
.scan(/\d+/).collect { |e| e.to_i }

distribution = [{},{},{}]
encrypted_values.each_with_index do |v, i|
  group = distribution[i%3]
  group[v] ||= 0
  group[v] += 1
end
# 32 is the ascii code for char blank
keys = distribution.collect { |group| group.max_by {|k, v| v}.first^32 }
# when use inject(reduce), diffs between do-end and {}
#see http://stackoverflow.com/questions/2127836/ruby-print-inject-do-syntax
res = encrypted_values.each_with_index.reduce(0) do |mem, v|
  which_key = keys.at v[1]%3
  mem += v[0]^which_key
end
p res