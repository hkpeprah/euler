--
-- Copyright (C) 2017 Ford Peprah - http://hkpeprah.com
-- GPL version 2 or later (see http://www.gnu.org/copyright/gpl.html)
--

-- | isPalindrome: consumes a number and returns True if that number is a
-- palindrome, otherwise False.
isPalindrome :: Integer -> Bool
isPalindrome 0 = True
isPalindrome n = isPalindrome' n $ largestPowerOfTen 0
  where largestPowerOfTen exp
          | n <= 0         = 0
          | (10 ^ exp) > n = (exp - 1)
          | otherwise      = largestPowerOfTen (exp + 1)
        isPalindrome' n k
          | n == 0         = True
          | k <= 0         = True
          | otherwise      = (lastDigit == headDigit) && isPalindrome' nRem (k - 2)
          where headDigit  = quot n (10 ^ k)
                lastDigit  = n `rem` 10
                nRem       = (quot (n - lastDigit) 10) - (headDigit * (10 ^ (k - 1)))

main = do
  putStrLn $ show $ largestPalindrome ((10 ^ exp) - 1) ((10 ^ exp) - 1) 0
  where exp                      = 3
        largestPalindrome x y largest
          | x < (10 ^ (exp - 1)) = largest
          | y < (10 ^ (exp - 1)) = largestPalindrome (x - 1) (x - 1) largest
          | isPalindrome prod    = largestPalindrome x (y - 1) $ max largest prod
          | otherwise            = largestPalindrome x (y - 1) largest
          where prod             = x * y
