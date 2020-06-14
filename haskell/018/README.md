# Problem 18 - Maximum Path Sum I

```
By starting at the top of the triangle below and moving to adjacent numbers on
the row below, the maximum total from top to bottom is 23.

                                       3
                                      7 4
                                     2 4 6
                                    8 5 9 3

That is, 3 + 7 + 4 + 9 = 23.

Find the maximum total from top to bottom of the triangle below:

                                75
                               95 64
                              17 47 82
                             18 35 87 10
                            20 04 82 47 65
                           19 01 23 75 03 34
                          88 02 77 73 07 63 67
                         99 65 04 28 06 16 70 92
                        41 41 26 56 83 40 80 70 33
                       41 48 72 33 47 32 37 16 94 29
                      53 71 44 65 25 43 91 52 97 51 14
                     70 11 33 28 77 73 17 78 39 68 17 57
                    91 71 52 38 17 14 91 43 58 50 27 29 48
                   63 66 04 68 89 53 67 30 73 16 69 87 40 31
                  04 62 98 27 23 09 70 98 73 93 38 53 60 04 23

NOTE: As there are only 16384 routes, it is possible to solve this problem by
trying every route. However, Problem 67, is the same challenge with a triangle
containing one-hundred rows; it cannot be solved by brute force, and requires a
clever method! ;o)
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
Similarily with the triangle above with 120 elements, we'd perform 120
comparisons in contrast to the aforementioned 16384 route computations.
