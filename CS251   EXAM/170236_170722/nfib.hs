import Data.List
import System.IO

fibonacii = 1 : 1 : [ y | x <- [2..] ,let y = ( (fibonacii !! (x-1) ) + (fibonacii !! (x-2) ) ) ] --list of fibonacci

fib :: Int -> Int

fib n = last(take n fibonacii) --nth fibonacci
