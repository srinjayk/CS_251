fib :: Int -> Int

fib 0 = 0
fib 1 = 1
fib n = fib (n - 1) + fib (n - 2) --gives the nth fibonacci number

fibList = map fib [1..] -- gives the list of fibonacci number from the above made function.