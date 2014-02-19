require "prime"

def eight_of_ten?(pattern)
  (0..9).map { |digit|
    pattern.to_s.gsub(/x/, digit.to_s).to_i
  }.select(&:prime?).length == 8
end

## for a prime str,
## return an array of prime string pattern, such as: "x3", "1xx7"
def replacement_patterns_of(prime_str)
  replaced_indexes = (0...prime_str.length).to_a.
                    group_by { |idx| prime_str[idx].to_i }.values.
                    select { |g| g.length >= 2 }

  replaced_indexes.flat_map { |g|
    (2..g.length).flat_map { |i| g.combination(i).to_a }
  }.map { |idxes|
    idxes.reduce(prime_str.dup) {|mem, idx| mem[idx] = 'x'; mem }.to_sym
  }
end



if __FILE__ == $0
  prime_enumerator = Prime.lazy
  replacements = Hash.new { |hash, key| hash[key] = [] }

  pattern = catch :found do
    loop do
      prime_str = prime_enumerator.next.to_s

      replacement_patterns_of(prime_str).each do |ptn|
        replacements[ptn] << prime_str.to_i
        throw :found, ptn if replacements[ptn].length == 8 && eight_of_ten?(ptn)
      end
    end
  end

  p pattern
  p replacements[pattern]
end
