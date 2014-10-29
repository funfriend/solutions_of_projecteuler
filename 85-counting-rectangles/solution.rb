threhold = 8_000_000

# for m in (1..52), m <= n
1..52.to_a.map { |m|
  sum_m = m * (m + 1)
  candidate_n = Math.sqrt(threhold.to_f / sum_m).floor
  sum_n = candidate_n * (candidate_n + 1)

  distance = threhold - sum_m * sum_n
  if distance < 0
    distance += sum_m * 2 * candidate_n
    [m, candidate_n - 1, distance]
  else
    [m, candidate_n, distance]
  end
}.min_by(&:last) # => [36, 77, 8]
