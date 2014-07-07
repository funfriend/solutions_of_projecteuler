## tips

1. Since knowing the farey sequence, it comes to the following property:

   > F<sub>n</sub> = F<sub>n-1</sub> + phi(n),
   > which function **phi** is [Euler's totient function](http://en.wikipedia.org/wiki/Euler%27s_totient_function)

   So, the problem reduces to how to compute the sum of `phi(n)` where n is from `2` to `d`.

2. The solution here uses a sieving method just like the sieve of Eratosthenes
   to compute `phi(p*k)` where `p` is a prime and `k` is a integer.
