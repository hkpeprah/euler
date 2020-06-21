--
-- Copyright (C) 2020 Ford Peprah - http://hkpeprah.com
-- GPL version 2 or later (see http://www.gnu.org/copyright/gpl.html)
--

import Data.Char (ord)
import System.IO

wordScore :: [Char] -> Integer
wordScore xs = wordScore' xs 0
  where wordScore' :: [Char] -> Integer -> Integer
        wordScore' [] acc     = acc
        wordScore' (x:xs) acc = wordScore' xs (val + acc)
          where val = toInteger $ (ord x) - ord('A') + 1

indexOf :: [Char] -> [[Char]] -> Maybe Integer
indexOf x ys = indexOf' x ys 0
  where indexOf' :: [Char] -> [[Char]] -> Integer -> Maybe Integer
        indexOf' x [] _       = Nothing
        indexOf' x (y:ys) acc
          | x == y    = Just acc
          | otherwise = indexOf' x ys (1 + acc)

nameScore :: [[Char]] -> [Char] -> Integer
nameScore namelist name = case indexOf name namelist of
                            (Just index) -> (index + 1) * (wordScore name)
                            Nothing      -> 0

nameScoreSum :: [[Char]] -> Integer
nameScoreSum namelist = foldr (+) 0 $ map (\x -> nameScore sorted x) sorted
  where sorted = insertionSort namelist

splitStrip :: [Char] -> [[Char]]
splitStrip xs = splitStrip' xs [] []
  where splitStrip' :: [Char] -> [Char] -> [[Char]] -> [[Char]]
        splitStrip' [] [] acc        = acc
        splitStrip' [] ys acc        = ys : acc
        splitStrip' ('"':xs) [] acc  = splitStrip' xs [] acc
        splitStrip' ('"':xs) ys acc  = splitStrip' xs [] (ys : acc)
        splitStrip' (',':xs) ys acc  = splitStrip' xs ys acc
        splitStrip' ('\r':xs) ys acc = splitStrip' xs ys acc
        splitStrip' ('\n':xs) ys acc = splitStrip' xs ys acc
        splitStrip' (x:xs) ys acc    = splitStrip' xs (ys ++ [x]) acc

insertionSort :: (Ord a) => [a] -> [a]
insertionSort list = insertionSort' list []
  where insertionSort' :: (Ord a) => [a] -> [a] -> [a]
        insertionSort' [] ys     = ys
        insertionSort' (x:xs) ys = insertionSort' xs $ insert x ys
        insert :: (Ord a) => a -> [a] -> [a]
        insert x []              = [x]
        insert x (y:ys)
          | x < y                = x : y : ys
          | otherwise            = y : (insert x ys)

main = do
  withFile "names.txt" ReadMode $ \handle -> do
    contents <- hGetContents handle
    putStrLn $ show $ nameScoreSum $ splitStrip contents
