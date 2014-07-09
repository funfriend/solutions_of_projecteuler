It's easy and straightforward to get to the problem using brute force method.

the answer use a set to keep non-repeating elements in the digit factorial chain
until a repeating element appears.

## Update

After this, a memo method is used to optimize the compution.

There is a trick here. Because every chains end up with a circle of:

> 169 → 363601 → 1454 → 169

> 871 → 45361 → 871

> 872 → 45362 → 872

So we can add the circle to the cache at first.
After this, when meeting the circle during computions of other starting numbers,
the cache is hited and computions stops.
Be careful of numbers like 145 and 1, 2.
When meeting the kind of numbers, update the cache of them, or it will loop forever.
