--
-- Copyright (C) 2020 Ford Peprah - http://hkpeprah.com
-- GPL version 2 or later (see http://www.gnu.org/copyright/gpl.html)
--

import Data.List (sort)

removeItem :: (Eq a) => a -> [a] -> [a]
removeItem x [] = []
removeItem x (y:ys)
  | x == y      = ys
  | otherwise   = y : (removeItem x ys)

perms :: (Ord a) => [a] -> [[a]]
perms list = perms' $ sort list
  where perms' :: (Ord a) => [a] -> [[a]]
        perms' [] = [[]]
        perms' xs = foldr (\x p -> (map (\a -> x : a) (perms' $ sort $ removeItem x xs)) ++ p) [] xs

main = do
  putStrLn $ show $ (permList !! index)
  where list     = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
        permList = map (\x -> foldr (\a b -> (show a) ++ b) "" x) $ perms list
        index    = 999999
