--
-- Copyright (C) 2017 Ford Peprah - http://hkpeprah.com
-- GPL version 2 or later (see http://www.gnu.org/copyright/gpl.html)
--

main = do
  putStrLn $ show $ head $ fact 2 600851475143 []
  where fact _ 1 xs = xs ++ [1]
        fact k n xs
          | n `mod` k == 0 = fact k (quot n k) $ [k] ++ xs
          | otherwise      = fact (k + 1) n xs

