--
-- Copyright (C) 2020 Ford Peprah - http://hkpeprah.com
-- GPL version 2 or later (see http://www.gnu.org/copyright/gpl.html)
--

import Debug.Trace

prev :: [Integer] -> [Integer]
prev xs = dropWhile (\x -> x == 0) $ reverse $ prev' $ reverse xs
  where prev' :: [Integer] -> [Integer]
        prev' (x:xs)
          | x > 0     = (x - 1) : xs
          | otherwise = 9 : (carry xs)
          where carry :: [Integer] -> [Integer]
                carry []     = []
                carry (0:ys) = 9 : (carry ys)
                carry (y:ys) = (y - 1) : ys

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

intToList :: Integer -> [Integer]
intToList n = intToList' n []
  where intToList' :: Integer -> [Integer] -> [Integer]
        intToList' n digits
          | (n == 0)  = digits
          | otherwise = intToList' nextN (digit : digits)
          where digit = mod n 10
                nextN = div (n - digit) 10

factorialDigitSum :: Integer -> Integer
factorialDigitSum n = foldr (+) 0 $ factorialDigitSum' n [1]
  where factorialDigitSum' :: Integer -> [Integer] -> [Integer]
        factorialDigitSum' 0 acc = acc
        factorialDigitSum' n acc = factorialDigitSum' (n - 1) newAcc
          where newAcc = foldr (\_ b -> (add acc b)) [0] [1..n]

main = do
  putStrLn $ show $ factorialDigitSum 100
