Use the similar way to solution3 of Euler 76.

But pay attention to **Avoiding BigInteger Computation**.

Since we are not interested in finding the actual number of partitions but just the first one divisible by one million,
we only need to save the last 7 digits,
So just take modulo of 1,000,000 before we store the result.
