# Problem 6 - Sum Square Difference

```
The sum of the squares of the first ten natural numbers is,

               1^2 + 2^2 + ... + 10^2 = 385

The square of the sum of the first ten natural numbers is,

            (1 + 2 + ... + 10)^2 = 552 = 3025

Hence the difference between the sum of the squares of the first ten natural
numbers and the square of the sum is 3025 − 385 = 2640.

Find the difference between the sum of the squares of the first one hundred
natural numbers and the square of the sum.
```

## Solution
The first part of this problem is to understand what the difference between
the sum of squares and the square of the sum is.  Consider the expansion of

```
(1 + 2 + 3)^2 = (1 + 2 + 3) * (1 + 2 + 3)
              = 1 * (1 + 2 + 3) + 2 * (1 + 2 + 3) + 3 * (1 + 2 + 3)
              = 1^2 + 1 * (2 + 3) + 2^2 + 2 * (1 + 3) + 3^2 + 3 * (1 + 2)
              = (1^2 + 2^2 + 3^2) + 1 * (2 + 3) + 2 * (1 + 3) + 3 * (1 + 2)
```

We see that the sum of squares expression `1^2 + 2^2 + 3^2` appears in our
solution, which means that we don't actually have to compute that value, as
it will cancel out in the difference between the square of sums and the sum
of squares.  What we really care about is the rest of the expression; the
product over a given number `x` when multiplied with the sum of the numbers
from `1` to `y` excluding `x` where `y` is the upper bound of our set.  Now,
lets look at the same set as before, but only consider the non-sum of squares
portion.  For clarity, we'll use variables `a`, `b`, and `c`.

```
(a + b + c)^2 = (a + b + c) * (a + b + c)
              = a^2 + ab + ac + ab + b^2 + bc + ac + bc + c^2
             ~= ab + ac + ab + bc + ac + bc
             ~= 2 * ab + 2 * ac + 2 * bc
             ~= 2 * (ab + ac + bc)
```

Which is a much simpler solution.  We could then speed up our algorithm by
observing that if we compute the sum of `a` to `c` (a constant time
operation), then subtract `a` and multiple by `a`, then we have the sum
`ab + ac`, then subtracting `b` and multiplying by `b` gets us the product
`bc`, then taking that sum and multiplying by two gets us our final solution.
