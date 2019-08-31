import Data.List
import System.IO

makeList :: [Int] -> [Int]
makeList (p:xs) = p : makeList [x | x <-xs, x `mod` p > 0]

primeList = makeList (2 : [3,5..]) --list of primes

prime :: Int -> Int

prime n = last(take n primeList) --nth prime