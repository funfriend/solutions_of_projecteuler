much like Coin-change problem.

I used to use a 2d array(dynamic programming from bottom to up) to solve this
based on an equation:

> C[n][m] = C[n][m-1] + C[n - coin[i]][m]

When I re-explore the problem,
I found [another approach][1] which is easy-understanding and faster.
It's strange that I haven't found it before...

TODO: https://en.wikipedia.org/wiki/Pentagonal_number_theorem

[1]: http://www.mathblog.dk/project-euler-31-combinations-english-currency-denominations/
