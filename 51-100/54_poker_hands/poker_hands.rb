#! /bin/sh ruby

# A card is represented by struct Card, and a hand is an 5-elem array of Card.
# First define the Card, then are methods judging a hand.
# At last, determine the rank of a hand, and compare two hands.

Card = Struct.new(:value, :suit) do
  include Comparable
  def self.trans(v)
    case v.to_s
    when /[2-9]/
      v.to_i
    when "T"
      10
    when "J"
      11
    when "Q"
      12
    when "K"
      13
    when "A"
      14
    else
      raise "Failed to translate the value #{v}"
    end
  end

  def <=>(another)
    self.class.trans(value) <=> another.class.trans(another.value)
  end

  def to_s
    "#{value}#{suit}"
  end

  def to_i
    self.class.trans value
  end
end

# methods to judge a poker hand, which are sorted by value

def royal_flush?(hand)
  if hand[-1].value.to_s == "A" && straight_flush?(hand)
    true
  else
    false
  end
end

def straight_flush?(hand)
  if straight?(hand) && flush?(hand)
    true
  else
    false
  end
end

def four_of_a_kind?(hand)
  if (hand[0].to_i == hand[3].to_i) ||
     (hand[1].to_i == hand[4].to_i)
    true
  else
    false
  end
end

def full_house?(hand)
  if (hand[0].to_i == hand[2].to_i && hand[3].to_i == hand[4].to_i) ||
     (hand[0].to_i == hand[1].to_i && hand[2].to_i == hand[4].to_i)
    true
  else
    false
  end
end

def flush?(hand)
  hand.all? { |c| c.suit == hand.first.suit }
end

def straight?(hand)
  if (hand[-1].to_i - hand[0].to_i == hand.length - 1) &&
     (hand.map(&:to_i).uniq.length == hand.length)
    true
  else
    false
  end
end

def three_of_a_kind?(hand)
  if (hand[0].to_i == hand[2].to_i) ||
     (hand[1].to_i == hand[3].to_i) ||
     (hand[2].to_i == hand[4].to_i)
    true
  else
    false
  end
end

def two_pairs?(hand)
  if hand.group_by(&:to_i).values.count {|e| e.length == 2} == 2
    true
  else
    false
  end
end

def one_pair?(hand)
  if hand.map(&:to_i).uniq.length == hand.length - 1
    true
  else
    false
  end
end

#########################################################

def rank_of(hand)
  hand = hand.sort
  cs = hand.map(&:to_i).group_by {|e| e}.values.sort_by {|e| [e.length, e.first]}
  res = [cs]
  if royal_flush?(hand)
    res.unshift :royal_flush
  elsif straight_flush?(hand)
    res.unshift :straight_flush
  elsif four_of_a_kind?(hand)
    res.unshift :four_of_a_kind
  elsif full_house?(hand)
    res.unshift :full_house
  elsif flush?(hand)
    res.unshift :flush
  elsif straight?(hand)
    res.unshift :straight
  elsif three_of_a_kind?(hand)
    res.unshift :three_of_a_kind
  elsif two_pairs?(hand)
    res.unshift :two_pairs
  elsif one_pair?(hand)
    res.unshift :one_pair
  else
    res.unshift :high_card
  end
end


RULES = {
  royal_flush: 1,
  straight_flush: 2,
  four_of_a_kind: 3,
  full_house: 4,
  flush: 5,
  straight: 6,
  three_of_a_kind: 7,
  two_pairs: 8,
  one_pair: 9,
  high_card: 10
}

def compare(one_hand, another_hand)
  rank1 = rank_of one_hand
  rank2 = rank_of another_hand
  if RULES[rank1.first] < RULES[rank2.first]
    1
  elsif RULES[rank1.first] > RULES[rank2.first]
    -1
  else
    rank1.last.reverse <=> rank2.last.reverse
  end
end


####################################################

def gen_hand_from(arr)
  arr.map { |e| Card.new(e[0], e[1]) }
end


# when running the file from terminal
if __FILE__ == $0
  wins = File.new("./poker.txt", 'r').readlines.count do |line|
    hs = line.chop.split
    t = compare gen_hand_from(hs[0...5]), gen_hand_from(hs[-5..-1])
    t >= 0
  end

  puts wins
end
