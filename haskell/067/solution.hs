--
-- Copyright (C) 2020 Ford Peprah - http://hkpeprah.com
-- GPL version 2 or later (see http://www.gnu.org/copyright/gpl.html)
--

import Data.Char (digitToInt)
import Data.Map (Map)
import System.IO

import qualified Data.Map as Map
import qualified Data.Text as Text

stringToInt :: [Char] -> Int
stringToInt [] = 0
stringToInt xs = stringToInt' 1 $ reverse xs
  where stringToInt' :: Int -> [Char] -> Int
        stringToInt' e []     = 0
        stringToInt' e (y:ys) = (e * (digitToInt y)) + (stringToInt' (e * 10) ys)


stringToIntList :: String -> [Int]
stringToIntList xs = map stringToInt $ words xs

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
  withFile "triangle.txt" ReadMode $ \handle -> do
    contents <- hGetContents handle
    putStrLn $ show $ maxPathSum $ map stringToIntList $ lines contents
