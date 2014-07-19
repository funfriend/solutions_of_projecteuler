matrix = File.readlines("matrix.txt").map do |line|
  line.chomp.split(",").map { |digits| digits.to_i }
end

path_sum = matrix.map(&:first)
cols = rows = matrix.length
(1...cols).each do |col|
  path_sum[0] += matrix[0][col]
  (1...cols).each do |row|
    path_sum[row] = [path_sum[row], path_sum[row - 1]].min + matrix[row][col]
  end
  (cols-2).downto(0) do |row|
    path_sum[row] = [path_sum[row], path_sum[row+1] + matrix[row][col]].min
  end
end

puts path_sum.min
