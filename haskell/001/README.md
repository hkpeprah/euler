# Problem 1 - Multiples of 3 and 5

```
If we list all the natural numbers below 10 that are multiples of 3 or 5, we
get 3, 5, 6 and 9. The sum of these multiples is 23.

Find the sum of all the multiples of 3 or 5 below 1000.
```

## Solution
The solution implemented here is in Haskell.  The gut of this solution is the
list comprehension:

```
[x | x <- [1..999], (x `rem` 3 == 0) || (x `rem` 5 == 0)]
```

We break this apart into peices.

```
[x | x <- [1..999]]
```

The above list comprehension is used to generate a list of numbers, `x`,
where `x` is pulled from the set of numbers from `1 - 999`;
`[x | x <- [1..999]]`.  Since we only want the numbers divisible by `3`
or `5`, we need to put a boolean guard.  Haskell makes this possible by
adding a comma after the set we draw from, then the condition.

```
[x | x <- [1..999], (x `rem` 3 == 0) || (x `rem` 5 == 0)]
```

Our condition is `(x ``rem`` 3 == 0) || (x ``rem`` 5 == 0)`, where `rem` is the
remainder operation.
