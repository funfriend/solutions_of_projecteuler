### Solution 1

Treat it as a change making problem.

Use a 2d array(dynamic programming from bottom to up) to solve this
based on an equation:

> C[n][m] = C[n][m-1] + C[n - coin[i]][m]

### Solution 2

When I re-explore the change making problem,
I found [another approach][1] which is easy-understanding and faster.
It's strange that I haven't found it before...

### Solution 3

There is a bunch of theories about the [integer partition][2].
Based on [pentagonal number theorem][3], solution3 use a generating function
which is `p(n) - p(n-1) - p(n-2) + p(n-5) + p(n-7) - p(n-12) - p(n-15) ... = 0`

Number theory is fantastic!

[1]: http://www.mathblog.dk/project-euler-31-combinations-english-currency-denominations/
[2]: https://en.wikipedia.org/wiki/Partition_(number_theory)
[3]: https://en.wikipedia.org/wiki/Pentagonal_number_theorem
