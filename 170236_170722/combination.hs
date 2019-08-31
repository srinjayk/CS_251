combination :: Int -> [a] -> [[a]]
combination 0 _ = [[]]
combination _ [] = []
combination n (x:xs) = (map (x:) (combination (n-1) xs)) ++ (combination n xs)

combinations n x = combination n (replace [] x)

check [] x = True
check (y:ys) x = if y==x then False else check ys x


replace y [] = y
replace y (x:xs) = if check y x == False then replace y xs else replace (y++[x]) xs 