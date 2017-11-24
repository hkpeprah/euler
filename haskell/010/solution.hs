--
-- Copyright (C) 2017 Ford Peprah - http://hkpeprah.com
-- GPL version 2 or later (see http://www.gnu.org/copyright/gpl.html)
--

sieve :: Int -> Int
sieve 1     = 0
sieve 2     = 0
sieve limit = sieve' 3 [2]
  where sieve' n primesList
          | n >= limit                                = foldr (+) 0 primesList
          | (length primesList) == (length multiples) = sieve' (n + 2) (primesList ++ [n])
          | otherwise                                 = sieve' (n + 2) primesList
          where multiples = takeWhile (\x -> n `rem` x /= 0) primesList

main = do
  putStrLn $ show $ sieve 2000000
