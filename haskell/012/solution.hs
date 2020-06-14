--
-- Copyright (C) 2020 Ford PEprah - http://hkpeprah.com
-- GPL version 2 or later (see: http://www.gnu.org/copyright/gpl.html)
--

solution :: Int -> Int
solution count = solution' 1 1
  where divisors :: Int -> Int -> [Int]
        divisors n a
          | (n == 1)           = [n]
          | (a <= 1)           = [1, n]
          | (n `mod` a) == 0   = a : divisors n (a - 1)
          | otherwise          = divisors n (a - 1)
        solution' :: Int -> Int -> Int
        solution' a n
          | (length d > count) = n
          | otherwise          = solution' (a + 1) (n + (a + 1))
          where d = divisors n $ n `div` 2

main = do
  putStrLn $ show $ solution count
  where count = 500
