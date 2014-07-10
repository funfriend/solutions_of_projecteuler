Use Euclid's formula, which is

> a = m<sup>2</sup> - n<sup>2</sup>

> b = 2mn

> c = m<sup>2</sup> + n<sup>2</sup>

> where m, n is integer and m > n >= 1

Euclid's formula can generate all primitive Pythagorean triples but not all Pythagorean triples.
In order to get all Pythagorean triples, multiply primitive Pythagorean triple by a integer k.
(that's because any Pythagorean triple is either primitive or a multiple of another primitive Pythagorean triple)

### Update: Tree of primitive Pythagorean triples

I have transformed the code using
[Tree of primitive Pythagorean triples](https://en.wikipedia.org/wiki/Tree_of_primitive_Pythagorean_triples)
instead of original `gcd(m,n)` and `(m-n).odd?` test to generate primitive Pythagorean triples.

However, the method seems to be slower, because of the frequent queue operation.
