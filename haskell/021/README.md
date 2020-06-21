# Problem 21 - Amicable Numbers

```
Let d(n) be defined as the sum of proper divisors of n (numbers less than n
which divide evenly into n).  If d(a) = b and d(b) = a, where a ≠ b, then a
and b are an amicable pair and each of a and b are called amicable numbers.

For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55
and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and
142; so d(284) = 220.

Evaluate the sum of all the amicable numbers under 10000.
```

## Solution

The solution implemented here uses a mapping of integers to their divisor sums
in order to prevent re-computing already computed divisors in our iteration
up to `10000`.  From there, we do a lookup on each integer, and add the integer
to our sum total if the lookup value, `dX = d(x)`, satisfies `dX == d(dX)`
where `d(n)` is the sum of the proper divisors of `n`.