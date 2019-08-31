import Data.List
import Data.Char
import Data.Maybe

---------------------------------------------QUESTION 1----------------------------------------------------------------------------------

string2int :: String -> Int
string2int xs = read xs :: Int

----------------------------------------------QUESTION 2----------------------------------------------------------------------------------
map'            :: (a -> b) -> [a] -> [b]
map' f []       = []
map' f xs   = reverse (foldl (\ys y -> (f y):ys) [] xs)

filter'             :: (a -> Bool) -> [a] -> [a]
filter' f []        = []
filter' f xs = reverse (foldl (\ys y -> if f y then y : ys else ys) [] xs)

----------------------------------------------QUESTION 4 : NUMBER TO WORDS -----------------------------------------------------------------------------------
onsies :: [String]
onsies = ["one","two","three","four","five","six","seven","eight","nine"]

ones :: Int -> String
ones n 
  | n > 0 && n < 10 = onsies !! (n-1)
  | otherwise       = error $ "ones: not a one-digit value"

tensies :: [String]
tensies = ["ten","twenty","thirty","forty","fifty","sixty","seventy","eighty","ninety"]

tens :: Int -> String
tens n 
  | n > 0 && n < 10 = tensies !! (n-1)
  | otherwise       = error " is not a tens place value"

teenies :: [String]
teenies = ["ten","eleven","twelve","thirteen","fourteen","fifteen","sixteen","seventeen","eighteen","nineteen"]

teens :: Int -> String
teens n 
  | n > 9 && n < 20 = teenies !! (n-10)
  | otherwise       = error " is not a teen"

groups :: [String]
groups = ["", " thousand", " million", " billion", " trillion"]

groupToWord :: Int -> String
groupToWord n
    | n == 0    = ""
    | n < 10    = ones n
    | n < 20    = teens n
    | n < 100   = tens (n `div` 10) ++ ' ' : (groupToWord $ n `mod` 10)
    | n < 1000  = ones (n `div` 100) ++ " hundred " ++ (groupToWord $ n `mod` 100)
    | otherwise = error (show n ++ " is not a 3-digit group")

splitNum :: Int -> [Int]
splitNum n
    | n <= 999 = [n]
    | otherwise = (n `mod` 1000) : splitNum (n `div` 1000)

toWordGroups :: [Int] -> [String]
toWordGroups (g:gs) = groupToWord g : toWordGroups gs
toWordGroups _ = []

newIntersperse :: [(String,String)] -> [String]
newIntersperse [] = []
newIntersperse (g:gs) = (fst g) : (snd g) : " " : newIntersperse gs

numToWords :: Int -> String
numToWords n
    | n == 0 = "zero"
    | otherwise = concat ( newIntersperse (reverse (zip (toWordGroups (splitNum n)) groups)))


--------------------------------------------QUESTION 4 : WORDS TO NUMBER--------------------------------------------------------------------------------------

mappedOnes :: [(String,Int)]
mappedOnes = [("one",1), ("two",2), ("three",3), ("four",4), ("five",5), ("six",6), ("seven",7),("eight",8), ("nine",9)]

mappedTens :: [(String,Int)]
mappedTens = [("ten",10), ("eleven",11), ("twelve",12), ("thirteen",13), ("fourteen",14),("fifteen",15), ("sixteen",16), ("seventeen",17), ("eighteen",18), ("nineteen",19)]

mappedTeens :: [(String,Int)]
mappedTeens = [("ten",10), ("twenty",20), ("thirty",30), ("forty",40), ("fifty",50), ("sixty",60),("seventy",70), ("eighty",80), ("ninety",90)]

mappedGroups :: [(String,Int)]
mappedGroups = [("thousand",3), ("million",6), ("billion",9), ("trillion",12)]
 
wordListToNum :: [String] -> Int -> Int
wordListToNum [] _ = 0
wordListToNum (x:xs) ptr
    | isJust (lookup x mappedGroups) =  wordListToNum xs (head(map (\(Just i)->i) [(lookup x mappedGroups)]))
    | isJust (lookup x mappedOnes) = head(map (\(Just i)->i) [(lookup x mappedOnes)])*(10^ptr) + wordListToNum xs ptr
    | isJust (lookup x mappedTeens) = head(map (\(Just i)->i) [(lookup x mappedTeens)])*(10^ptr) + wordListToNum xs ptr
    | isJust (lookup x mappedTens) = head(map (\(Just i)->i) [(lookup x mappedTens)])*(10^ptr) + wordListToNum xs ptr
    | x == "zero" = wordListToNum xs ptr
    | x == "hundred" = wordListToNum xs (ptr+2)

wordToNum :: String -> Int
wordToNum xs = wordListToNum (reverse (words (clean xs))) 0

clean :: String -> String
clean "" = ""
clean xs = removePunc (unwords (cleanHelper (words xs)))

cleanHelper :: [String] -> [String]
cleanHelper [] = []
cleanHelper (x:xs) 
    | (x == " " || x == "and") = cleanHelper xs
    | otherwise = x:cleanHelper xs

removePunc :: String -> String
removePunc xs = [ x | x <- xs, not (x `elem` ",.-") ]