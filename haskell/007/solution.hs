--
-- Copyright (C) 2017 Ford Peprah - http://hkpeprah.com
-- GPL version 2 or later (see http://www.gnu.org/copyright/gpl.html)
--

sieve' x n acc
  | (n == 0)            = last acc
  | isPrime             = sieve' (x + 2) (n - 1) (acc ++ [x])
  | otherwise           = sieve' (x + 2) n acc
  where isPrime = (length acc) == (length $ takeWhile (\y -> x `mod` y /= 0) acc)

sieve 1 = 1
sieve 2 = 2
sieve n = sieve' 3 (n - 2) []

main = do
  putStrLn $ show $ sieve 10002
