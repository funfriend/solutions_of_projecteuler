## Solution

The answer is rather simple!

Only one rule here:

> S[0, 0] = m[0, 0]

> S[a, 0] = S[a - 1, 0] + m[a, 0], for a > 0

> S[0, b] = S[0, b - 1] + m[0, b], for b > 0

> S[a, b] = min(S[a - 1, b], S[a, b - 1]) + m[a, b], for a > 0 and b > 0
