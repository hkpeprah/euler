--
-- Copyright (C) 2020 Ford Peprah - http://hkpeprah.com
-- GPL version 2 or later (see http://www.gnu.org/copyright/gpl.html)
--

data Day =
  Monday
  | Tuesday
  | Wednesday
  | Thursday
  | Friday
  | Saturday
  | Sunday
  deriving (Enum, Eq, Ord, Show)

data Month =
  January
  | February
  | March
  | April
  | May
  | June
  | July
  | August
  | September
  | October
  | November
  | December
  deriving (Enum, Eq, Ord, Show)

data Date = Date Day Integer Month Integer
  deriving (Eq, Show)

instance (Ord Date) where
  (Date _ d1 m1 y1) <= (Date _ d2 m2 y2) = (y1 < y2) || (y1 == y2) && ((m1 < m2) || ((m1 == m2) && (d1 < d2)))

dayOfWeek :: Date -> Day
dayOfWeek (Date d _ _ _) = d

dayOfMonth :: Date -> Integer
dayOfMonth (Date _ d _ _) = d

isLeapYear :: Integer -> Bool
isLeapYear year
  | (not isCentury) && ((mod year 4) == 0) = True
  | isCentury && ((mod year 400) == 0)     = True
  | otherwise                              = False
  where isCentury = (mod year 100) == 0

numDays :: Month -> Integer -> Integer
numDays January year   = 31
numDays February year
  | isLeapYear year    = 29
  | otherwise          = 28
numDays March year     = 31
numDays April year     = 30
numDays May year       = 31
numDays June year      = 30
numDays July year      = 31
numDays August year    = 31
numDays September year = 30
numDays October year   = 31
numDays November year  = 30
numDays December year  = 31

nextDay :: Day -> Day
nextDay Sunday = Monday
nextDay day    = succ day

nextDate :: Date -> Date
nextDate (Date dow dom month year) = (Date nextDow nextDom nextM nextY)
  where nextDom = if (numDays month year) == dom then 1 else (dom + 1)
        nextDow = nextDay dow
        nextM   = if (nextDom == 1) then (if (month == December) then January else succ month) else month
        nextY   = if (nextM == January && nextDom == 1) then year + 1 else year

countDates :: Date -> Date -> Day -> Integer -> Integer
countDates start end dow dom = countDates' (Date Monday 1 January 1900) 0
  where countDates' :: Date -> Integer -> Integer
        countDates' current n
          | (current > end)             = n
          | (current < start)           = countDates' nd n
          | (dayOfWeek current) /= dow  = countDates' nd n
          | (dayOfMonth current) /= dom = countDates' nd n
          | otherwise                   = countDates' nd (n + 1)
          where nd = nextDate current

main = do
  putStrLn $ show $ countDates start end Sunday 1
  where start = (Date Monday 1 January 1901)
        end   = (Date Monday 31 December 2000)
