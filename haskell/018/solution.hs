--
-- Copyright (C) 2020 Ford Peprah - http://hkpeprah.com
-- GPL version 2 or later (see http://www.gnu.org/copyright/gpl.html)
--

import Data.Map (Map)
import qualified Data.Map as Map

example = [
  [3],
  [7, 4],
  [2, 4, 6],
  [8, 5, 9, 3]
  ]

pyramid = [
  [75],
  [95, 64],
  [17, 47, 82],
  [18, 35, 87, 10],
  [20, 4, 82, 47, 65],
  [19, 1, 23, 75, 3, 34],
  [88, 2, 77, 73, 7, 63, 67],
  [99, 65, 4, 28, 6, 16, 70, 92],
  [41, 41, 26, 56, 83, 40, 80, 70, 33],
  [41, 48, 72, 33, 47, 32, 37, 16, 94, 29],
  [53, 71, 44, 65, 25, 43, 91, 52, 97, 51, 14],
  [70, 11, 33, 28, 77, 73, 17, 78, 39, 68, 17, 57],
  [91, 71, 52, 38, 17, 14, 91, 43, 58, 50, 27, 29, 48],
  [63, 66, 4, 68, 89, 53, 67, 30, 73, 16, 69, 87, 40, 31],
  [4, 62, 98, 27, 23, 9, 70, 98, 73, 93, 38, 53, 60, 4, 23]
  ]

maxPathSum :: [[Int]] -> Int
maxPathSum [] = 0
maxPathSum t  = fst $ maxPathSum' 0 0 $ Map.fromList []
  where maxPathSum' :: Int -> Int -> Map (Int, Int) Int -> (Int, Map (Int, Int) Int)
        maxPathSum' x y c
          | (y >= (length t))        = (0, Map.insert (x, y) 0 c)
          | (x >= (length $ t !! y)) = (0, Map.insert (x, y) 0 c)
          | otherwise                = case Map.lookup (x, y) c of
                                         (Just member) -> (member, c)
                                         Nothing       -> (bMax, Map.insert (x, y) bMax rCache)
                                           where (lMax, lCache) = maxPathSum' x (y + 1) c
                                                 (rMax, rCache) = maxPathSum' (x + 1) (y + 1) lCache
                                                 bMax           = ((t !! y) !! x) + (max lMax rMax)

main = do
  putStrLn $ show $ maxPathSum triangle
  where triangle = pyramid
