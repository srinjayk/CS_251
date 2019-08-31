import Data.List 
import Data.Ord
-------------------------------------------------------------------------------GIVES THE FREQUENCY LOOKUP TABLE IN INCREASING ORDER------------------------------------------------------------------------------------------------
sortedList :: String -> [(Char,Int)]
sortedList xs = sortBy (comparing snd) ( map (\a -> (head a, length a)) (group ( sort (joinString(xs)) ) ) )
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

wordMatch :: String -> String -> Int --function tells total number of common words in 2 strings.
wordMatch [] _ = 0
wordMatch _ [] = 0
wordMatch (x:xs) (y:ys)=
    if(x==y)
        then (1 + wordMatch xs ys)
        else wordMatch xs ys

noOfMatchingWord :: [String] -> [String] -> Int --utility function for score
noOfMatchingWord [] _ = 0
noOfMatchingWord _ []= 0
noOfMatchingWord (x:xs) ys
    | dictionaryLookup ys x == True = 1 + noOfMatchingWord xs ys
    | otherwise                     = noOfMatchingWord xs ys

--------------------------------------------------------------------SCORE FUNCTION TELLS HOW GOOD IS THE TEXT READABILITY------------------------------------------------------------------------------------------------------------
score :: String -> Int -- Gives the number of matching words in the text from the dictionary
score xs = noOfMatchingWord (words xs) wordDictionary
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


joinString :: String -> String --removes . ' space \n from the text file
joinString [] = []
joinString (x:xs)=
    if((x==' ')||(x=='\n'))
        then joinString xs
        else x:joinString xs


---------------------------------------------------------------------CIPHER ALPHABETS USED FOR MAPPING----------------------------------------------------------------------------------------------------------
cipherList :: [Char]
cipherList = ['e','t','o','n','i','a','s','r','h','d','l','u','p','w','y','g','c','f','m','b','v','j','k','x','q','z']

-- cipherList :: [Char]
-- cipherList = ['e','t','a','o','i','n','s','r','h','d','l','u','c','m','f','y','w','g','p','b','v','k','x','q','j','z']
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


---------------------------------------------------------------------THIS SCORE FUNCTION DECIPHERS THE CIPHER USING CIPHERLIST AND TELLS TEXT READABILITY----------------------------------------------------------------------------------------------------------
improveScoreCheck :: String -> Int --Gives the score of the cipher's mapping according to the current mapping of cipher text with alphabet text. It decodeds and then call score function.
--Only give the string which returns the improved mapping
improveScoreCheck xs =score (decryptMessage xs) 
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


decryptMessageHelper :: String -> [(Char,Char)] -> String --utitlity function for decryption of message
decryptMessageHelper (x:xs) ys
    | x `elem` (map fst ys) = ((map snd ys) !! (head(map (\(Just i) -> i) [(x `elemIndex` (map fst ys))])) ) : decryptMessageHelper xs ys
    | otherwise             = x:decryptMessageHelper xs ys


-------------------------------------------------------------------THIS FUNCTION DECIPHERS THE TEXT------------------------------------------------------------------------------------------------------------
decryptMessage :: String -> String --It deciphers the message according to the known cipher.
decryptMessage xs = decryptMessageHelper xs (makeMapping xs)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

wordDictionary :: [String] --just an example dictionary
wordDictionary = ["ever","never","speed","haskell","c","reading","all"]

dictionaryLookup :: [String] -> String -> Bool --Dictionar lookup gives true if String is present in [String] else false . 
dictionaryLookup [] key = False
dictionaryLookup (x:xs) key =
    if (x==key)
        then True
        else dictionaryLookup xs key

swapElementsAt :: Int -> Int -> [a] -> [a] -- Swap 2 element in a list according to indices
swapElementsAt i j xs = 
    let elemI = xs !! i
        elemJ = xs !! j
        left = take i xs
        middle = take (j - i - 1) (drop (i + 1) xs)
        right = drop (j + 1) xs
        in  left ++ [elemJ] ++ middle ++ [elemI] ++ right

charMapping :: [(Char,Int)] -> [Char] -> [(Char,Char)] --utitlity function for mapping list of tuples's char to CipherList's char
charMapping [] _ = []
charMapping _ [] = []
charMapping ((a,b):xs) (y:ys) = (a,y):charMapping xs ys

reverseList :: [(Char,Int)] -> [(Char,Int)] --Invert the list of tuples of char and int
reverseList  [] = []
reverseList  xs = last xs : reverseList (init xs)

finalMapping :: [(Char,Char)] --This maps charecter to the CipherList
finalMapping = charMapping (reverseList((sortedList (joinString "6;’) *‡; 7*‡]08†38 ;45; 6) ).(85†6*3 ;4(‡?34 ;48 6*;8(*8;, 6; 6) 6*1‡(95;6‡* ]46-4 6) 286*3 ?)8†, 5*† ;45; ;‡‡, ‡* 5 ;89.‡(5(: 25)6) ‡*0:. ]45; ]8 16*† ‡*8 -06-7 5]5: 6) ‡*0: 6*1‡(95;6‡*: 15-;) ;45; ]8 (85† 5*† ?*†8();5*† 2?; †‡ *‡; (8;56*.\n281‡(8 ;48 5†¶8*; ‡1 ;48 -:28( ]‡(0†, 61 )‡98‡*8 ]5*;8† ;‡ 16*† ‡?; 52‡?; 5 -‡?*;(: ;48: ]6)48† ;‡ ¶6)6;, ;48: ]8*; ;‡ 062(5(68) 5*† 2‡‡7 );‡(8); ;48: (85† ;(5¶80 3?6†8) 5*† (8)85(-48† 85-4 5*† 8¶8(: †8;560 52‡?; ;48 -‡?*;(:. ;48: ]8*; ‡?; 5*† )5] ;48 ]‡(0†, $?8);6‡*8† 6;, ;(68† ;‡ ?*†8();5*† 6;. ;48: *8¶8( 3‡‡308† 6;, ;(:6*3 ;‡ -‡*)?98 500 )‡(;) ‡1 †8;560) 6* 5 ).5* ‡1 15 96*?;8).6*†88†, (85†6*3 ;48 52);(5-; ‡1 5 (8)85(-4 .5.8( ;‡ -6;8 6; 6) *‡; 8*‡?34. ‡*06*8 (8)85(-4 – 8¶8* 61 :‡? ?)8 ‡*06*8 2‡‡7), 6) *‡; 8*‡?34. :‡? *88† ;‡ 3‡ ‡?;. :‡?( .4:)6-50 )801 *88†) ;‡ 8¢.8(68*-8 ;48 (850 ]‡(0†, ;48 7*‡]08†38. ;48(8 )4‡?0† 28 6998()6‡*. 5 305*-8 5; ;48 ](6;;8* ]‡(† ;4(‡?34 5 )-(88* 6) *‡; 8*‡?34.\n;48 6*;8(*8; 6) .(‡1‡?*†0: 05-76*3 ]48* 6; -‡98) ;‡ -5;8(6*3 ;‡ ;48 3(‡];4 ‡1 4?95* 286*3). 6; †‡8) *‡;46*3 1‡( ;48 4?95* 6*;8008-; ‡( ;48 4?95* ).6(6;; 500 6; †‡8) 6) .(‡¶6†8 ?) ]6;4 *?98(‡?) ;:.8) ‡1 6*1‡(95;6‡*. ¶8(: 18] 9634; (8506)8 6;, 2?; ;46) 480.1?0 ;‡‡0 ;45; ]8 -500 ;48 6*;8(*8; 6) 5 -?()8 6* )8¶8(50 ]5:). 500 ;45; ;48 6*;8(*8; 45) 8¶8( †‡*8 6) );53*5;8 ;48 96*†, 5*† †?00 ;48 )‡?0. 5*† 6 ;46*7 6;’) 52‡?; ;698 ]8 );‡..8† (80:6*3 ‡* 6;.") ))) cipherList

----------------------------------------------------------------------THIS FUNCTION DISPLAY THE MAPPING OF CIPHER CHARECTERS AND ALPHABETS---------------------------------------------------------------------------------------------------------
makeMapping :: String -> [(Char,Char)] ---same as finalMapping but with variable string
makeMapping xs = charMapping (reverseList (sortedList (joinString xs))) cipherList
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
