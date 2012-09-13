def permutation a, b, e
  if b == e then p a; return end
  b.upto(e) do |i|
    a[b], a[i] = a[i], a[b]
    permutation a, b+1, e
    a[b], a[i] = a[i], a[b]
  end
end

permutation [1,2,3], 0, 2



p '-------------------'

## another solution
def find_fall_from_right_of a
  (a.length-2).downto(0) do |i|
    return i if a[i] < a[i+1]
  end
  return nil
end

def permutation_second a
  a.sort_by! { |obj| obj }
  p a
  while(i = find_fall_from_right_of a)
    j = a.rindex { |v| v > a[i] }
    a[i], a[j] = a[j], a[i]
    a = a[0..i] + a[(i+1)..-1].sort_by! {|v| v}
    p a
  end
end

permutation_second [1,2,3]
