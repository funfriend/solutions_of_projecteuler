# !/bin/sh ruby
require "prime"


def can_be_pair?(p1, p2)
  Prime.prime?("#{p1}#{p2}".to_i) && Prime.prime?("#{p2}#{p1}".to_i)
end

def can_be_pairs?(p, ps)
  ps.all? { |e| can_be_pair?(p, e) }
end

if __FILE__ == $0
  prime_pairs = Array.new
  prime_enumerator = Prime.lazy
  catch :found do
    loop do
      prime = prime_enumerator.next
      p prime
      prime_pairs.each do |ps|
        if can_be_pairs?(prime, ps)
          ps << prime

          if ps.length == 5
            puts ps
            throw :found
          end
        end
      end
      prime_pairs << [prime]
      p prime_pairs
    end
  end
end
