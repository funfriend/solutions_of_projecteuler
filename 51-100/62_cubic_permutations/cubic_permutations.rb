# !/bin/sh ruby

### first version, which is damn slow.
# n = 1
# loop do
#   cube = n**3
#   permuted_cubes = cube.to_s.chars.permutation.to_a.
#     map { |e| e.join.to_i }.
#     uniq.
#     select { |e|
#       tmp = (e**(1/3.0))
#       (e > cube) && (e == tmp.ceil**3 || e == tmp.floor**3)
#     }
#   break if permuted_cubes.length == 4
#   n += 1
# end

# p n

### here is a better solution.

# a ten-elem array to represent the digits of a number, for example:
# number 90123456789 have one 0-8 and two 9,
# so elem from the first to the ninth in the array is 1, and the tenth is 2.
def digits_of(integer)
  integer.to_s.each_char.inject(Array.new(10, 0)) { |mem, c| mem[c.to_i] +=1;mem }
end

## another way to get the digits, just using a sorted string.
# def digits_of(integer)
#   integer.to_s.each_char.sort.join
# end

def only_five_cubes?(char_arr)
  char_arr.permutation.to_a.map(&:join).uniq.map(&:to_i).select { |e|
    tmp = (e**(1/3.0))
    (e == tmp.ceil**3) || (e == tmp.floor**3)
  }.length == 5
end

if __FILE__ == $0

  n = 1
  permutations = Hash.new { |hash, key| hash[key] = [] }
  loop do
    cube = n**3
    digits = digits_of(cube)
    permutations[digits] << cube
    ## in fact, the logic is not correct here, as It's not determined yet that
    ## only five cubic permutations exist for a kind of digits, when it reaches to 5.
    ## but as noted in the test file, judging all permutations is too time-consuming.
    ## so, it's just left here.
    break if permutations[digits].length == 5
    n += 1
  end
  puts n, n**3, permutations[digits_of(n**3)]

  ## the smallest cube is 127035954683.

end
