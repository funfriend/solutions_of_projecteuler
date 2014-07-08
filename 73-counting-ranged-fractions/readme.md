## How

To count the numbers between `a/b` and `c/d`,
start from the two fractions and generate mediants until the denominator exceeds the limit.
In a whole, it generates and traverses a binary tree whose deepth is the limited `d`.

The code is rather straightforward, as *the function is recursive*.

## Update

I have rewritten the code to non-recursive version.
However, it doesn't gain some efficiency... strangeee

Also, add another solution which borrowed from
[math blog](http://www.mathblog.dk/project-euler-73-sorted-reduced-proper-fractions/)
