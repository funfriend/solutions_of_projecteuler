module Prime
  def self.prime?(n)
    return false if (not n.integer?) or (n < 2)
    return true if n==2 or n == 3
    return false if n%2==0 or n%3==0

    up = Math.sqrt(n).floor
    not 5.step(up, 6).any? {|m| n%m==0 or n%(m+2)==0}
  end

  def self.sieve_eratosthenes(n)
    flag = Array.new(n+1, true)
    flag[0] = flag[1] = false
    first, last = 2, Math.sqrt(n)
    first.upto(last) do |i|
      (2*i).step(n, i) {|t| flag[t] = false} if flag[i]
    end
    flag.each_with_index.map { |e, i| e ? i : false }.select { |e| e }
  end
end

# module Prime
#   def self.prime2? n
#     return false if n<2
#     return true if n==2 || n==3
#     return false if n%2==0 || n%3==0
#     i = 5
#     lower = Math.sqrt(n).floor
#     until i>lower
#       return false if n%i==0 || n%(i+2)==0
#       i+=6
#     end
#     return true
#   end
# end

if __FILE__ == $0
  # p Prime.sieve_eratosthenes ARGV[0].to_i
  require "benchmark"
  Benchmark.bmbm do |results|
    results.report("sieve_eratosthenes: ") {Prime.sieve_eratosthenes ARGV[0].to_i}
  end
  # Benchmark.bmbm do |x|
  #   x.report("prime") {Prime.prime? ARGV[0].to_i}
    # x.report("prime2") {Prime.prime2? ARGV[0].to_i}
  # end
end