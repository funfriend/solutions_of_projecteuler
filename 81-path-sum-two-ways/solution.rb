matrix = File.readlines("matrix.txt").map do |line|
  line.chomp.split(",").map { |digits| digits.to_i }
end

# init a[0][i], which i > 0
(1...matrix.first.length).each do |i|
  matrix[0][i] += matrix[0][i-1]
end
# init a[i][0], which i > 0
(1...matrix.length).each do |i|
  matrix[i][0] += matrix[i-1][0]
end


(1...matrix.length).each do |row|
  (1...matrix[row].length).each do |col|
    matrix[row][col] += [matrix[row][col-1], matrix[row-1][col]].min
  end
end

puts matrix.last.last
