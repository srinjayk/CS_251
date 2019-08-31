
rev [] = []
rev xs = rev (tail xs) ++ [head xs]

facA n = if n > 1
         then n * facA(n-1)
         else n

fibA n = if n == 0
         then 1;
         else if n == 1
         then 1;
         else fibA(n-2) + fibA(n-1)
