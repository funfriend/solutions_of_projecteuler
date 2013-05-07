require "date"
require "benchmark"

ans = 0
1901.upto(2000) do |year|
  1.upto(12) do |month|
    ans += 1 if Date.new(year, month, 1).sunday?
  end
end

puts ans