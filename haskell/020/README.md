# Problem 20 - Factorial Digit Sum

```
n! means n × (n − 1) × ... × 3 × 2 × 1

For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.

Find the sum of the digits in the number 100!
```

## Solution

We approach this question assuming we're not working in a language that
supports big numbers, such that we can't simply call `100!`, convert the result
to a string, then sum the individual digits by iterating them, and converting
them to their integral representation.  Therefore, in order to do the large
factorial, we need to implement a method capable of performing long-addition.
Multiplication is just successive addition, so we can repeatedly call that
method in order to compute the result.