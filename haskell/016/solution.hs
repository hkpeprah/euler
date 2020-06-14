--
-- Copyright (C) 2020 Ford Peprah - http://hkpeprah.com
-- GPL version 2 or later (see http://www.gnu.org/copyright/gpl.html)
--

add :: [Int] -> [Int] -> [Int]
add xs ys
  | sumCarry == 0               = sum
  | sumCarry < 10               = sumCarry : sum
  | otherwise                   = (div (sumCarry - (mod sumCarry 10)) 10) : (mod sumCarry 10) : sum
  where add' :: [Int] -> [Int] -> ([Int], Int)
        add' (x:[]) (y:[])      = ([digit], carry)
          where sum             = x + y
                digit           = mod sum 10
                carry           = div (sum - digit) 10
        add' (x:xs) (y:ys)      = (digit : res, carry)
          where (res, resCarry) = add' xs ys
                sum             = x + y + resCarry
                digit           = mod sum 10
                carry           = div (sum - digit) 10
        (sum, sumCarry)         = add' xs ys

numToList :: Int -> [Int]
numToList n
  | n < 10        = [n]
  | otherwise     = (numToList r) ++ [d]
  where d = n `rem` 10
        r = (n - d) `div` 10

powerDigitSum :: Int -> Int -> Int
powerDigitSum n 0 = 1
powerDigitSum n 1 = n
powerDigitSum n e = foldr (+) 0 $ powerDigitSum' (numToList n) e
  where powerDigitSum' :: [Int] -> Int -> [Int]
        powerDigitSum' xs 0 = [1]
        powerDigitSum' xs 1 = xs
        powerDigitSum' xs e = powerDigitSum' (add xs xs) (e - 1)

main = do
  putStrLn $ show $ powerDigitSum 2 exp
  where exp = 1000
