# Problem 4 - Largest Palindrome Product

```
A palindromic number reads the same both ways. The largest palindrome made
from the product of two 2-digit numbers is 9009 = 91 × 99.

Find the largest palindrome made from the product of two 3-digit numbers.
```

## Solution
The function `isPalindrome` returns whether a number is a palindrome or not.
It computes this by first computing the largest power of ten by which the given
number is divisible to use to extract the first digit, and check it against the
last digit.  If both are the same, it continues by removing the first and last
digit; this is done by subtracting the last digit from the number then dividing
by `10`, and subtracting the first digit multiplied by the current power of `10`
minus `1`.

Using the method `isPalindrome`, we are able to compute the largest palindrome
for a particular digit count by starting with the largest number with the given
amount of digits and multiplying it by all numbers less than itself up until
the last number with the same number of digits, and taking the maximum value
that is still a palindrome, then checking that against the maximum palindrome
for the next number in the sequence.
