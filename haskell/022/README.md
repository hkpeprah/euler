# Problem 22 - Names Scores

```
Using names.txt (right click and 'Save Link/Target As...'), a 46K text file
containing over five-thousand first names, begin by sorting it into
alphabetical order. Then working out the alphabetical value for each name,
multiply this value by its alphabetical position in the list to obtain a name
score.

For example, when the list is sorted into alphabetical order, COLIN, which is
worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So, COLIN would
obtain a score of 938 × 53 = 49714.

What is the total of all the name scores in the file?
```

## Solution

Computing the name value is done by converting the integer to its ordinal
value, then subtracting the ordinal value of 'A' (as the first integer) to
get its character value.  Summing those all up give us the word score for the
name.  To get its name score, we then need the position of the name within the
sorted name list.  To sort the name list, we can use a basic insertion sort.