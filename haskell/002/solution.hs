--
-- Copyright (C) 2017 Ford Peprah - http://hkpeprah.com
-- GPL version 2 or later (see http://www.gnu.org/copyright/gpl.html)
--

main = do
  putStrLn $ show $ sum $ filter (\n -> n `mod` 2 == 0) $ takeWhile (< 4000000) $ fib' 0 1
  where fib' 0 1 = [] ++ fib' 1 1
        fib' x y = [y] ++ fib' y (x + y)
