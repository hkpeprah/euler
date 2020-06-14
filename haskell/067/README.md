# Problem 67 - Maximum Path Sum II

```
By starting at the top of the triangle below and moving to adjacent numbers on
the row below, the maximum total from top to bottom is 23.

                                       3
                                      7 4
                                     2 4 6
                                    8 5 9 3

That is, 3 + 7 + 4 + 9 = 23.

Find the maximum total from top to bottom in [triangle.txt](./triangle.txt), a
15K text file containing a triangle with one-hundred rows.

NOTE: This is a much more difficult version of Problem 18. It is not possible
to try every route to solve this problem, as there are 2^99 altogether! If you
could check one trillion (1012) routes every second it would take over twenty
billion years to check them all. There is an efficient algorithm to solve it.
;o)
```

## Solution
We want to avoid re-computing sums we have already computed, so starting from
top of the pyramid, we want to work our way downwards saving the maximum at
each point.  So assuming we start from the center top, we'd take the max
between the left branch `7` and right branch `4`. At each of those branches,
we'd take the maximum between the left and right branch, caching the result to
avoid re-computing the sum of the right branch as it would be the left branch
of the next element in the row.  This means that each point in the pyramid is
touched at most once, so for a pyramid with 10 elements (as in the first case),
performance is linear, O(n), where n is the number of elements in the pyramid.
