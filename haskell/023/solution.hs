--
-- Copyright (C) 2020 Ford Peprah - http://hkpeprah.com
-- GPL version 2 or later (see http://www.gnu.org/copyright/gpl.html)
--

import Data.Set (Set)
import qualified Data.Set as Set

divisors :: Integer -> (Set Integer)
divisors 0 = Set.fromList []
divisors 1 = Set.fromList [1]
divisors n = divisors' (div n 2) $ Set.fromList []
  where divisors' :: Integer -> (Set Integer) -> (Set Integer)
        divisors' 0 acc = acc
        divisors' 1 acc = Set.insert 1 acc
        divisors' a acc
          | (mod n a) == 0 = divisors' (a - 1) (Set.insert a acc)
          | otherwise      = divisors' (a - 1) acc

abundantNumbers :: Integer -> (Set Integer)
abundantNumbers 0 = Set.fromList []
abundantNumbers 1 = Set.fromList []
abundantNumbers n
  | sumDivisors > n = Set.insert n $ abundantNumbers (n - 1)
  | otherwise       = abundantNumbers (n - 1)
  where sumDivisors = foldr (+) 0 $ divisors n

sumAbundantNumbers :: Integer -> Integer
sumAbundantNumbers n = sumAbundantNumbers' n 0
  where abundance                        = abundantNumbers n
        abundanceList                    = Set.toList abundance
        sumAbundantNumbers' :: Integer -> Integer -> Integer
        sumAbundantNumbers' 0 acc        = acc
        sumAbundantNumbers' 1 acc        = 1 + acc
        sumAbundantNumbers' n acc
          | anySum n abundanceList       = sumAbundantNumbers' (n - 1) acc
          | otherwise                    = sumAbundantNumbers' (n - 1) (n + acc)
        anySum :: Integer -> [Integer] -> Bool
        anySum x []                      = False
        anySum x (y:ys)
          | Set.member (x - y) abundance = True
          | otherwise                    = anySum x ys

main = do
  putStrLn $ show $ sumAbundantNumbers 28123
