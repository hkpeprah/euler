# Problem 5 - Smallest Multiple

```
2520 is the smallest number that can be divided by each of the numbers from 1
to 10 without any remainder.

What is the smallest positive number that is evenly divisible by all of the
numbers from 1 to 20?
```

## Solution
This problem can be solved mathematically.  Essentially, a number that is
evenly divisible by all the numbers from 1..20 must have every prime number
from 1..20 as a factor of itself.  This yields us the list:
`1, 2, 3, 5, 7, 11, 13, 17, 19`.  However, this is not enough, as the product
of these, `9699690`, is not evenly divisible by something like `8`, which is
contained within the set.  This is because the prime factorization of `8`
contains two additional `2`s which do not appear within the set given above.
So for each number in the set 1..20, we have to determine their prime
factorization and check that the set is fully contained within our current
set of numbers.
