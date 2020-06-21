--
-- Copyright (C) 2020 Ford Peprah - http://hkpeprah.com
-- GPL version 2 or later (see http://www.gnu.org/copyright/gpl.html)
--

import Data.Map (Map)
import qualified Data.Map as Map

divisors :: Integer -> [Integer]
divisors 0 = []
divisors 1 = [1]
divisors n = divisors' (div n 2) []
  where divisors' :: Integer -> [Integer] -> [Integer]
        divisors' 0 acc = acc
        divisors' 1 acc = 1 : acc
        divisors' a acc
          | (mod n a) == 0 = divisors' (a - 1) (a : acc)
          | otherwise      = divisors' (a - 1) acc

amicableNumbers n = amicableNumbers' n dMap 0
  where dMap = foldr (\x m -> Map.insert x (sum $ divisors x) m) (Map.fromList []) [1..n]
        amicableNumbers' :: Integer -> (Map Integer Integer) -> Integer -> Integer
        amicableNumbers' 1 m acc = acc
        amicableNumbers' x m acc
          | (x == y)               = amicableNumbers' (x - 1) m acc
          | (dX == y) && (dY == x) = amicableNumbers' (x - 1) m (acc + x)
          | otherwise              = amicableNumbers' (x - 1) m acc
          where dX = case Map.lookup x dMap of
                  (Just a) -> a
                  Nothing  -> 0
                y  = dX
                dY = case Map.lookup y dMap of
                  (Just b) -> b
                  Nothing  -> 0

main = do
  putStrLn $ show $ amicableNumbers 10000
