## how to solve it

The answer is [farey sequence](http://en.wikipedia.org/wiki/Farey_sequence)

How fancy it can be!

the solution uses a property of farey sequence, which is

> if a/b and c/d are neighbors in a farey sequence,
> then the first term that appears between them as the order of farey increases
> is (a+c)/(b+d), which first appears in the Farey sequence of order b+d.

As to this problem, I just approach to 3/7 from 2/5.
and when the `b+d` exceeds 1,000,000, I know it's time to stop.
