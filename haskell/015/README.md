# Problem 15 - Lattice Paths

```
Starting in the top left corner of a 2×2 grid, and only being able to move to
the right and down, there are exactly 6 routes to the bottom right corner.

How many such routes are there through a 20×20 grid?
```

## Solution
This problem can be solved purely mathematical.  Consider the presented 2x2
grid.  In the top left corner, we can choose one of two paths to take.  Assume
that we take the right path, we then can either go down, or go right again.
If we go right again, then our only option is to go down twice.  If we go down,
then our two options are to go down then right, or to go right then down.  This
gives us 3 paths from going right.  Similarly, we have 3 paths from going down.
If we count the length of each of the paths, the result is that each path
measures length 4.  So we want to determine the number of permutations of a
path of length 4.  Falling the walls (top left to bottom left to bottom right,
and top left to top right to bottom right) there is precisely one path for
each.  Assuming we don't follow the wall, we get two paths from the center
point following from the right, and bottom of the top left corner.  More
broadly, we cross at most N squares (where N is the width of the square) if we
do not follow the wall of the grid.  So number of paths is the number of
permutations of length 4 choosing 2 squares, or more generally:

                   num_routes = path_length choose grid_width
