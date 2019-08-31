insertAt :: Char -> String -> Int -> String
insertAt y (xs) n = ( (fst (splitAt (n-1) (xs)))++[y]++(snd (splitAt (n-1) (xs))) )

--splitAt n list ==> splits the list in tuples of left part of string and right part of string.