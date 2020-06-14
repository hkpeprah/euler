--
-- Copyright (C) 2020 Ford Peprah - http://hkpeprah.com
-- GPL version 2 or later (see http://www.gnu.org/copyright/gpl.html)
--

main = do
  putStrLn $ show $ div n $ d * d
  where w = 20
        n = foldr (*) 1 [1..w * 2]
        d = foldr (*) 1 [1..w]
