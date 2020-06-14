# Problem 16 - Power Digit Sum

```
2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.

What is the sum of the digits of the number 2^1000?
```

## Solution
Assuming we're using a language with large numbers, we can just compute the
result of 2^1000, convert it to a string, then sum the integer representation
of the individual digits.  For the solution here, I make the assumption that
we are not working in such a language, and instead have to perform long
multiplication ourselves using a list of integers.  The result is then computed
by summing up the digits of the integer list.