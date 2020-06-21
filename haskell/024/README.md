# Problem 24 - Lexicographic Permutations

```
A permutation is an ordered arrangement of objects. For example, 3124 is one
possible permutation of the digits 1, 2, 3 and 4. If all of the permutations
are listed numerically or alphabetically, we call it lexicographic order. The
lexicographic permutations of 0, 1 and 2 are:

                       012   021   102   120   201   210

What is the millionth lexicographic permutation of the digits 0, 1, 2, 3, 4, 5,
6, 7, 8 and 9?
```

## Solution

To solve this problem, we can use to our adventure the laziness of the Haskell
language.  Assuming we weren't using such a language, we could add an index to
our permutation calculator using the mathematical properties of permutations;
given a string of length `n`, there are `n!` permutations of the string, and
so for any starting digit, there are `n! / n` (or `(n - 1)!`) lengths with that
starting digit, then narrow down to the specific permutation from that.  Given
that Haskell is lazy, we can instead implement a permutations method by taking
each element of the sorted list, and concatenating it to each string generated
by calling permutations recursively on the list with said element removed, and
so on recursively.
