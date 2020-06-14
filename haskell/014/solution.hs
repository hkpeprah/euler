--
-- Copyright (C) 2020 Ford Peprah - http://hkpeprah.com
-- GPL version 2 or later (see http://www.gnu.org/copyright/gpl.html)
--

import Data.Map (Map)
import qualified Data.Map as Map

collatz :: Int -> Map Int Int -> (Int, Map Int Int)
collatz n cache
  | n < 1     = (0, cache)
  | n == 1    = (1, cache)
  | otherwise = case Map.lookup n cache of
                  (Just member) -> (member, cache)
                  Nothing -> (nSeqL, (Map.insert n nSeqL cache))
                where nextN          = if (n `mod` 2 == 0) then (n `div` 2) else (1 + 3 * n)
                      (seqL, nCache) = collatz nextN cache
                      nSeqL          = seqL + 1

solution :: Int -> Int
solution end                     = fst $ solution' 1 $ Map.fromList []
  where solution' :: Int -> Map Int Int -> (Int, Map Int Int)
        solution' n cache
          | n >= (end - 1)      = (n, cache)
          | nSeqL > seqL        = (nextN, nCache)
          | otherwise           = (n, nCache)
          where (seqL, iCache)  = collatz n cache
                (nextN, nCache) = solution' (n + 1) iCache
                nSeqL           = case Map.lookup nextN nCache of
                                    (Just member) -> member
                                    Nothing       -> 0

main = do
  putStrLn $ show $ solution n
  where n = 999999
