# !/bin/sh ruby


def continued_fraction(n)
  a0 = Math.sqrt(n).floor
  cf = [a0]

  q = s = 1
  p = t = a0

  loop do
    tq = (n - p**2)/q
    tp = tq - p%tq

    # add this hack ...
    tp = tp + ((a0 - tp)/tq)*tq
    #

    a = (p + tp)/tq
    cf << a
    p, q = tp, tq
    break if p == t && q == s
  end

  cf
end

p (1..10000).count { |i|
  Math.sqrt(i).floor**2 != i && continued_fraction(i).length%2 == 0
}
