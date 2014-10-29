# !/bin/sh ruby
require "prime"


def can_be_pair?(p1, p2)
  Prime.prime?("#{p1}#{p2}".to_i) && Prime.prime?("#{p2}#{p1}".to_i)
end

def can_be_pairs?(p, ps)
  ps.all? { |e| can_be_pair?(p, e) }
end

if __FILE__ == $0
  prime_pairs = [[], [], [], [], []]
  prime_enumerator = Prime.lazy

  Prime.lazy.take_while { |p| prime_pairs.last.empty? }.each do |prime|
    p prime
    upgrades = prime_pairs[0...-1].map do |pairs|
      pairs.select { |ps| can_be_pairs?(prime, ps) }.map { |ps| ps + [prime] }
    end

    prime_pairs.first << [prime]
    prime_pairs.drop(1).zip(upgrades) { |ps, added| ps.push(*added) }
    p prime_pairs.map(&:length)
  end

  puts prime_pairs.last
end
