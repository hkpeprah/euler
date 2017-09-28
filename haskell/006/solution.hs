--
-- Copyright (C) 2017 Ford Peprah - http://hkpeprah.com
-- GPL version 2 or later (see http://www.gnu.org/copyright/gpl.html)
--

main = do
  putStrLn $ show $ (*) 2 $ fst $ foldl (\(y,z) x -> (y + x * (z - x), z - x)) (0, sumN) [1..100]
  where sumN = quot (100 * 101) 2
