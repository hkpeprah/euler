# Problem 9 - Special Pythagorean Triplet

```
A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,

                             a^2 + b^2 = c^2

For example, 32 + 42 = 9 + 16 = 25 = 52.

There exists exactly one Pythagorean triplet for which a + b + c = 1000.
Find the product abc.
```

## Solution
We have a set of two equations.  Using one of these equations, we can represent
one of the variables in terms of the other two.  In this case, we can represent
`c` as `c = 1000 - a - b`.  We can take that and plug it into the equation
`a^2 + b^2 = c^2`, which yields `a^2 + b^2 = (1000 - a - b)^2`.  Simplifying
this, we get `ab - 1000a - 1000b + 500000 = 0` or `ab = 1000(a + b - 500)`.
Since both `a` and `b` are natural numbers, we can conclude that their product
is a natural number, therefore the result of `a + b - 500` must also be
natural.  In addition, the result must also be possible, so it is the case that
`1000 > a + b >= 500`.  So we just need to try values for `a` and `b` within
that range.
