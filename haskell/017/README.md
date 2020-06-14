# Problem 17 - Number Letter Counts

```
If the numbers 1 to 5 are written out in words: one, two, three, four, five,
then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

If all the numbers from 1 to 1000 (one thousand) inclusive were written out in
words, how many letters would be used?


NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and
forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20
letters. The use of "and" when writing out numbers is in compliance with
British usage.
```

## Solution
We build a table / pattern matching of sorts to map the numbers 1-19 inclusive
to their integer length values (e.g. `1 -> one -> 3`).  We then need to include
mappings for the numbers `20`, `30`, `40`, etc., `100`, and `1000`.  As the
word `and` can appear as in `123 -> one hundred and 23`, when computing the
length for said numbers, we add an additional `3` if the remainder after
dividing by `100` is `0`.
