incrrange :: [Int] -> (Int,Int) -> [Int]

incrrange (xs) (m,n) = ( fst ( splitAt (m-1) (xs) ) ) ++ ( map addfunc ( fst ( splitAt (n-m+1) ( snd ( splitAt (m-1) (xs) ) ) ) ) ) ++ ( snd ( splitAt (n-m+1) ( snd ( splitAt (m-1) (xs) ) ) ) )

addfunc :: Int -> Int

addfunc x = x+1