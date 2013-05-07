#!/usr/bin/ruby
=begin
zero:
one:
two:
three:
four:
five:
six:
seven:
eight:
nine:
ten:

eleven:
twelve:
thirteen:
fourteen:
fifteen:
sixteen:
seventeen:
eighteen:
nineteen:

twenty:
thirty:
forty:
fifty:
sixty:
seventy:
eighty:
ninety:

hundred:
=end

symbols = {
  :'1' => 3,
  :'2' => 3,
  :'3' => 5,
  :'4' => 4,
  :'5' => 4,
  :'6' => 3,
  :'7' => 5,
  :'8' => 5,
  :'9' => 4,
  :'10' => 3,

  :'11' => 6,
  :'12' => 6,
  :'13' => 8,
  :'14' => 8,
  :'15' => 7,
  :'16' => 7,
  :'17' => 9,
  :'18' => 8,
  :'19' => 8,

  :'20' => 6,
  :'30' => 6,
  :'40' => 5,
  :'50' => 5,
  :'60' => 5,
  :'70' => 7,
  :'80' => 6,
  :'90' => 6,
}

res = 0
1.upto(1000) do | i |
  #deal with 千分位
  t, left = i/1000, i%1000
  res += symbols[t.to_s.to_sym] + 'thousand'.length unless t == 0
  #deal with 百分位
  h, left = left/100, left%100
  res += symbols[h.to_s.to_sym] + 'handred'.length unless h == 0
  #deal with the last
  unless left == 0
    res += 'and'.length unless h == 0
    if left <= 20
      res += symbols[left.to_s.to_sym]
    else
      p, left = left/10, left%10
      res += symbols[(p*10).to_s.to_sym]
      res += symbols[left.to_s.to_sym] unless left == 0
    end
  end
end

puts res