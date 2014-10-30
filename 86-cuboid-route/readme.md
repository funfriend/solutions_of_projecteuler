For a cubiod of *a* by *b* by *c* (*a <= b <= c*),
the shortest route is *sqrt((a+b)^2 + c^2)*.

Let's say:

1. *F(m)*: the number of cuboids for which the shortest route has integer length, and *1 <= a <= b <= c <= m*.

2. *f(m)*: the number of cubiods for which the shortest route has integer length, and * 1 <= a <= b <= c = m*.

Think about it, and we can get *F(m) = F(m-1) + f(m)* !


#### Compute *f(m)*

What we need to do next is compute *f(m)*.

based on *c = m*, find all the numbers in *[2, 2m]*(what *a+b* can reach to) that can make *sqrt((a+b)^2 + m^2)* a integer.
Then, for each of these numbers, count the possible combinations of *a* and *b*.

Let's say *t* is such a number, we can have the following things:

- if *2 <= t <= m*, the number of combinations is *floor(t/2)*,
- if *m < t <= 2m*, the number of combinations is *floor((2m-t)/2) + 1*.

After that, just sum all of it, and that is the *f(m)*.
