# Problem 25 - 1000-Digit Fibonacci Number

```
The Fibonacci sequence is defined by the recurrence relation:

                   Fn = Fn−1 + Fn−2, where F1 = 1 and F2 = 1.

Hence the first 12 terms will be:

                   F1 = 1
                   F2 = 1
                   F3 = 2
                   F4 = 3
                   F5 = 5
                   F6 = 8
                   F7 = 13
                   F8 = 21
                   F9 = 34
                   F10 = 55
                   F11 = 89
                   F12 = 144

The 12th term, F12, is the first term to contain three digits.

What is the index of the first term in the Fibonacci sequence to contain 1000
digits?
```

## Solution

Here we again assume we are working in a language that doe snot support large
integers, and choose to represent our numbers as integers.  We then implement a
function that returns all Fibonnaci numbers, and use the fact that Haskell is
lazy to take integers from said list until we hit a number represented as a
list with a length of `1000`.  The length of the generated list from taking
elements is equal to the index of the first term containing 1000 digits.  As
that assumes zero-indexing, we add 1 to get the result.
