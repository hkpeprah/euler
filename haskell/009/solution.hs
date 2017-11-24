--
-- Copyright (C) 2017 Ford Peprah - http://hkpeprah.com
-- GPL version 2 or later (see http://www.gnu.org/copyright/gpl.html)
--

solution :: Int
solution = solution' 1 499
  where solution' a b
          | ((a ^ 2) + (b ^ 2) == (c ^ 2)) = a * b * c
          | a + b + 1 == 1000              = solution' (a + 1) (500 - (a + 1))
          | otherwise                      = solution' a (b + 1)
          where c = 1000 - a - b

main = do
  putStrLn $ show $ solution
