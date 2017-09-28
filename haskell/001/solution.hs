--
-- Copyright (C) 2017 Ford Peprah - http://hkpeprah.com
-- GPL version 2 or later (see http://www.gnu.org/copyright/gpl.html)
--

main = do
  putStrLn $ show $ sum $ [x | x <- [1..999], (x `rem` 3 == 0) || (x `rem` 5 == 0)]
