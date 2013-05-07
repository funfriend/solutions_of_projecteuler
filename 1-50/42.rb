words = nil
eval("words = [#{File.read('42-words.txt')}]")

res = 0
words.each do |word|
  value = 0
  word.each_codepoint { |c| value += (c-64)}
  n = Math.sqrt(2*value).floor
  res += 1 if 2*value == n*(n+1)
end

p res