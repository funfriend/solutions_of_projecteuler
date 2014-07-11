### Solution 1

Treat it as a change making problem.

Use a 2d array(dynamic programming from bottom to up) to solve this
based on an equation:

> C[n][m] = C[n][m-1] + C[n - coin[i]][m]

### Solution 2

When I re-explore the change making problem,
I found [another approach][1] which is easy-understanding and faster.
It's strange that I haven't found it before...

### TODO

I just realized there is a bunch of theories about the [integer partition][2]


[1]: http://www.mathblog.dk/project-euler-31-combinations-english-currency-denominations/
[2]: https://en.wikipedia.org/wiki/Partition_(number_theory)
