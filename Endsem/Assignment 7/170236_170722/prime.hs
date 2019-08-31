prime :: Int -> Int
nextPrime :: Int -> Int
checkPrime :: Int -> Bool
test :: Int -> Int -> Bool

nextPrime 2 = 2 --gives the next prime after n
nextPrime n
    | checkPrime n = n --if n is prime it returns n
    | otherwise = nextPrime (n + 2)	--if n is not prime check for next number to be prime after a gap of 2
    	                            --because n is odd so n+2  will be odd and only case of even is when n=2
                                    --as nextPrime is never called for even n

checkPrime 2 = True
checkPrime n
    | n < 2 = False
    | n `mod` 2 == 0 = False
    | otherwise = test n 3 --check for divisibility with all odd number as in case if n is even and not 2 then we would have already returned.

test x y --test if x is divisible by y or not if divisible then return false else call test x (y+2) and check divisibility of x with next odd nuumber
    | x `mod` y == 0 = False
    | y^2 > x = True --if there's no number till root x that divides x this implies there's no number less than x that divides x and hence x is prime
    | otherwise = test x (y + 2)

prime 1 = 2
prime 2 = 3
prime n = nextPrime ((prime (n-1)) + 2) --gives the nth prime and nextPrime is always called for even value as outcome of
                                        --prime (n-1) will be always odd as prime 2 would never be called as prime 3 is set

primeList = map prime [1..] --map prime function to all natural number to get the list.