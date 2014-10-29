A rectangle measuring *m* by *n* (*m <= n*) contains *f(i, j)* rectangles measuring *i* by *j*(*1 <= i <= m* and *1 <= j <= n*).
So, the total number is sum of all *f(i, j)*, which is `m(m+1)/2 * n(n+1)/2`.

Then the problem can be reduced to:
**find a pair of m,n which minimize `8000000 - m(m+1)n(n+1)` **

#### Analysis

1. *sqrt(8_000_000) = 2828.42712474619*, so the bigest *m* that satisfies *m(m+1) <= 2828.42712474619* is **52**
3. then for each m <= 52, guess the biggest *n* that minimize `8000000 - m(m+1)n(n+1)`.
4. one possible number for the *n* is the floor of `sqrt(8_000_000 / m(m+1))`.
5. calculate it, if not correct, decrease it by **1**.
