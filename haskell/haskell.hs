import Data.List
import Data.Char
import System.IO
import Data.Bits
import Data.Maybe

toBin :: Int -> [Int] --This convert a positive number to its binary
toBin 0 = [0]
toBin n | n `mod` 2 == 1 = toBin (n `div` 2) ++ [1]
        | n `mod` 2 == 0 = toBin (n `div` 2) ++ [0]

bitCompliment :: Int -> Int --define compliment of a bit
bitCompliment 0 = 1
bitCompliment 1 = 0

compliment :: [Int] -> [Int] -- this convert a binary list to its compliment
compliment [] = []
compliment (x:xs) = bitCompliment x : compliment (xs)

bitSum :: Int -> [Int] -> [Int] -> [Int]  -- adds 2 binary number and mention the carry bit
bitSum _ [] [] = []
bitSum 0 [] (x:xs) = x : xs
bitSum 1 [] (1:xs) = 0 : bitSum 1 [] xs
bitSum 1 [] (0:xs) = 1 : xs
bitSum 0 (x:xs) [] = x : xs
bitSum 1 (1:xs) [] = 0 : bitSum 1 [] xs
bitSum 1 (0:xs) [] = 1 : xs
bitSum 0 (0:xs) (0:ys) = 0 : bitSum 0 xs ys
bitSum 1 (0:xs) (0:ys) = 1 : bitSum 0 xs ys
bitSum 0 (1:xs) (1:ys) = 0 : bitSum 1 xs ys
bitSum 1 (1:xs) (1:ys) = 1 : bitSum 1 xs ys
bitSum 0 (x:xs) (y:ys) = 1 : bitSum 0 xs ys
bitSum 1 (x:xs) (y:ys) = 0 : bitSum 1 xs ys
bitSum carry (x:xs) (y:ys) | x==y = carry : bitSum x xs ys
                           | otherwise = (bitCompliment carry) : bitSum carry xs ys

adder :: [Int] -> [Int] -> [Int] --this is used as a adder for 2 binary number
adder [] [] = []
adder [] ys = ys
adder xs [] = xs
adder xs ys = reverse ( bitSum 0 (reverse xs) (reverse ys))  

noOfZero :: [Int] -> Int --equates the number of zeros in the binary number list
noOfZero [] = 0
noOfZero (x:xs)
    | x==0 = 1 + noOfZero xs
    | otherwise = noOfZero xs

noOfOne :: [Int] -> Int -- equates the number of one in the binary list
noOfOne [] = 0
noOfOne (x:xs)
    | x==1 = 1 + noOfOne xs
    | otherwise = noOfOne xs

adderMonad :: Maybe [Int] -> Maybe [Int] -> Maybe [Int] --takes 2 maybe list and returns the maybe list
adderMonad mx my =
    mx >>= (\x -> (my >>= (\y -> adderCase x y )))

adderCase :: [Int] -> [Int] -> Maybe [Int] --Decide to add or give the error message
adderCase xs ys
    | (noOfZero xs) == (noOfOne xs) = Nothing
    | (noOfZero ys) == (noOfOne ys) = Nothing
    | otherwise = Just (adder xs ys)

twoCompliment :: String -> [Int] -- take a string and return the 2 compliment list of the binary string
twoCompliment (x:xs)    
    | [x] == "-" = adder (compliment (toBin (read xs :: Int ))) [1]
    | otherwise = toBin (read (x:xs) :: Int)

oneComp :: [Int] -> [Int] -- convert a binary string to its ones compliment
oneComp [] = []
oneComp (x:xs)=
    if(x==0) then 
        1 : oneComp xs
    else
        0 : oneComp xs

twoComp :: [Int] -> [Int] --convert a binary string to its twos compliment
twoComp  xs = adder (oneComp xs) [1]

listToString :: [Int] -> String --convert a list of binary to string format
listToString [] = []
listToString (x:xs) = (show x) ++ listToString xs

stringToList :: [Char] -> [Int] --convert a string of binary to list of int
stringToList [] = []
stringToList (x:xs) = (read [x] :: Int) : stringToList xs

shiftLeft :: [Int] -> [Int] --shiftLeft basically shift the binary list to right and a element from left side
shiftLeft xs = (head xs) : (init xs)  

mrShift :: [Int] -> Int -> [Int] -- this shift shift the binary list in right and adds the mentioned integer from right
mrShift xs a= init ([a] ++ xs) 

boothMultiplication :: [Int] -> [Int] -> Int -> Int -> Int -> [Int] -> [Int] --this carry out booths algorithm and return the multiplication result
boothMultiplication ac mr qni qnf sc md =
    if(sc>0) then
        if(qni==0 && qnf==1) then
            boothMultiplication (shiftLeft (adder ac md)) (mrShift mr (last (adder ac md)))  (last (shiftLeft mr)) (last mr) (sc-1) md
        else if(qni==1 && qnf==0) then
            boothMultiplication (shiftLeft (adder ac (twoComp md))) (mrShift mr (last (adder ac (twoComp md))))  (last (shiftLeft mr)) (last mr) (sc-1) md
        else
            boothMultiplication (shiftLeft ac) (mrShift mr (last ac)) (last (shiftLeft mr)) (last mr) (sc-1) md
    else
        ac ++ mr

monadicDescionMaker :: String -> String -> Int -> Maybe String --It decide wether to multiply or not
monadicDescionMaker xs ys n
    | (noOfOne (stringToList xs))==(noOfZero (stringToList xs)) = Nothing
    | (noOfOne (stringToList ys))==(noOfZero (stringToList ys)) = Nothing
    | otherwise = Just (boothMultiplicationfinal xs ys n)

boothMultiplicationAnswer :: String -> String -> Int -> String --Decide the error message and call the boothmultiplication function
boothMultiplicationAnswer xs ys n
    | (monadicDescionMaker xs ys n == Nothing) = "error :either of the multiplicand have same no of zeros and ones."
    | otherwise = fromJust (monadicDescionMaker xs ys n)

boothMultiplicationfinal :: String -> String -> Int -> String --caller function for boothmultiplication in desired format
boothMultiplicationfinal xs ys n = listToString ( boothMultiplication (nLengthZeroList n) (stringToList ys) (read [last ys] :: Int ) 0 n (stringToList xs) )

boothMultiplicationPrint :: [Int] -> [Int] -> Int -> Int -> Int -> [Int] -> String -> String --this function print all the register for booths multiplication if called in given format
boothMultiplicationPrint ac mr qni qnf sc md str=
    if(sc>0) then
        if(qni==0 && qnf==1) then
            boothMultiplicationPrint (shiftLeft (adder ac md)) (mrShift mr (last (adder ac md)))  (last (shiftLeft mr)) (last mr) (sc-1) md (str++(listToString ac)++"-"++(listToString mr)++"-"++(show qnf)++"\n")
        else if(qni==1 && qnf==0) then
            boothMultiplicationPrint (shiftLeft (adder ac (twoComp md))) (mrShift mr (last (adder ac (twoComp md))))  (last (shiftLeft mr)) (last mr) (sc-1) md (str++(listToString ac)++"-"++(listToString mr)++"-"++(show qnf)++"\n")
        else
            boothMultiplicationPrint (shiftLeft ac) (mrShift mr (last ac)) (last (shiftLeft mr)) (last mr) (sc-1) md (str++(listToString ac)++"-"++(listToString mr)++"-"++(show qnf)++"\n")
    else
        str

boothMultiplicationPrintfinal :: String -> String -> Int -> String -- Helps in printing all the registers
boothMultiplicationPrintfinal xs ys n = boothMultiplicationPrint (nLengthZeroList n) (stringToList ys) (read [last ys] :: Int ) 0 (n+1) (stringToList xs) ""

nLengthZeroList :: Int -> [Int] --make a n length list of zeros
nLengthZeroList 0 = []
nLengthZeroList itr = 0 : nLengthZeroList (itr-1)

boothMultiplicationPrintAnswer :: String -> String -> Int -> String --Decide wether to print the register and print accordingly
boothMultiplicationPrintAnswer xs ys n
    | (monadicDescionMaker xs ys n == Nothing) = "no process undertaken"
    | otherwise = boothMultiplicationPrintfinal xs ys n

main = do
    putStrLn "Enter value of number of bits:"
    n <- getChar
    a <- getLine
    putStrLn "Enter 2 numbers:"
    a1 <- getLine
    a2 <- getLine
    putStrLn "\n<ACK>-<MR>-<QN+1>\n"
    let reg = boothMultiplicationPrintAnswer a1 a2 (digitToInt n)
    let mul = "Multiplication: "++boothMultiplicationAnswer a1 a2 (digitToInt n)
    putStrLn reg
    if (reg == "no process undertaken") then main else putStrLn mul