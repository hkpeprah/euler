# Problem 14 - Longest Collatz Sequence

```
The following iterative sequence is defined for the set of positive integers:

                              n -> n/2 (n is even)
                              n -> 3n + 1 (n is odd)

Using the rule above and starting with 13, we generate the following sequence:

               13 -> 40 -> 20 -> 10 -> 5 -> 16 -> 8 -> 4 -> 2 -> 1

It can be seen that this sequence (starting at 13 and finishing at 1) contains
10 terms. Although it has not been proved yet (Collatz Problem), it is thought
that all starting numbers finish at 1.

Which starting number, under one million, produces the longest chain?

NOTE: Once the chain starts the terms are allowed to go above one million.
```

## Solution
This problem can be optimized by caching the collatz sequence length of every
number as we go from 1 to our maximum number.  So to solve this, starting at 1,
we compute the collatz sequence and store the length of the result, then we
move into the next number, stopping when we hit a number we have already cached
the collatz sequence length for.  We return the number with the largest collatz
sequence under 1,000,000.
