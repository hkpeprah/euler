--
-- Copyright (C) 2020 Ford Peprah - http://hkpeprah.com
-- GPL version 2 or later (see http://www.gnu.org/copyright/gpl.html)
--

add :: [Integer] -> [Integer] -> [Integer]
add a b = add' (reverse a) (reverse b) 0 []
  where add' :: [Integer] -> [Integer] -> Integer -> [Integer] -> [Integer]
        add' [] [] 0 acc             = acc
        add' [] [] carry acc         = carry : acc
        add' (a:as) [] carry acc     = add' as [] newCarry (newA : acc)
          where newA     = mod (a + carry) 10
                newCarry = div ((a + carry) - newA) 10
        add' [] (b:bs) carry acc     = add' [] bs newCarry (newB : acc)
          where newB     = mod (b + carry) 10
                newCarry = div ((b + carry) - newB) 10
        add' (a:as) (b:bs) carry acc = add' as bs newCarry (s : acc)
          where s        = mod (a + b + carry) 10
                newCarry = div ((a + b + carry) - s) 10

fibs :: [[Integer]]
fibs = fibs' [1] [1]
  where fibs' :: [Integer] -> [Integer] -> [[Integer]]
        fibs' fn1 fn2 = fn2 : fibs' fnext fn1
          where fnext = add fn1 fn2

main = do
  putStrLn $ show $ 1 + (length $ takeWhile (\x -> (length x) < n) fibs)
  where n = 1000
