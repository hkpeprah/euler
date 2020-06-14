--
-- Copyright (C) 2020 Ford Peprah - http://hkpeprah.com
-- GPL version 2 or later (see http://www.gnu.org/copyright/gpl.html)
--

numToCount :: Int -> Int
numToCount 0       = 0
numToCount 1       = 3
numToCount 2       = 3
numToCount 3       = 5
numToCount 4       = 4
numToCount 5       = 4
numToCount 6       = 3
numToCount 7       = 5
numToCount 8       = 5
numToCount 9       = 4
numToCount 10      = 3
numToCount 11      = 6
numToCount 12      = 6
numToCount 13      = 8
numToCount 14      = 8
numToCount 15      = 7
numToCount 16      = 7
numToCount 17      = 9
numToCount 18      = 8
numToCount 19      = 8
numToCount 20      = 6
numToCount 30      = 6
numToCount 40      = 5
numToCount 50      = 5
numToCount 60      = 5
numToCount 70      = 7
numToCount 80      = 6
numToCount 90      = 6
numToCount 100     = 10
numToCount n
  | n > 1000       = error "Number larger than allowable range."
  | n == 1000      = (numToCount $ div n 1000) + 8 + (numToCount $ rem n 1000)
  | mod n 100 == 0 = (numToCount $ div n 100) + 7
  | n > 100        = (numToCount $ div n 100) + 10 + (numToCount $ rem n 100)
  | otherwise      = (numToCount $ n - (rem n 10)) + (numToCount $ rem n 10)

main = do
  putStrLn $ show $ foldr (+) 0 $ map (\x -> numToCount x) [1..n]
  where n = 1000
