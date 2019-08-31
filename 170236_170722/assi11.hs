import Data.Char

--adder function
adder [] s_new [] 0 = s_new
adder [] s_new [] 1 = '1':s_new
adder (so:s_old) s_new [] flag = 
	if(flag==0) then
		adder s_old (so:s_old) [] flag
	else
		if(so =='1') then
			adder s_old ('0':s_new) [] flag
		else
			adder s_old ('1':s_new) [] 0
adder [] s_new  (a:add) flag = 
	if(flag==0) then
		adder [] (a:s_new) add flag
	else
		if(a=='1') then
			adder [] ('0':s_new) add flag
		else
			adder [] ('1':s_new) add 0
adder (so:s_old) s_new (a:add) flag = 
	if (flag==1) then
		if(so == '1') && (a =='1') then
			adder s_old ('1':s_new) add 1
		else if (a=='1') || (so=='1') then
			adder s_old  ('0':s_new) add 1
		else 
			adder s_old ('1':s_new) add 0
	else
		if(a == '1') && (so =='1') then
			adder s_old ('0':s_new) add 1
		else if (a=='1') || (so=='1') then
			adder s_old  ('1':s_new) add 0
		else 
			adder s_old ('0':s_new) add 0

--this function reverses the string
rev [] b = b
rev (a:as) b = rev as b++[a]

--this function computes the two's complement
two_com [] b = adder [] [] (rev b []) 1
two_com (a:as) b = if(a=='1') then two_com as (b++['0']) else two_com as (b++['1'])


shift (a) i [] =  shift a i a  
shift a 0 f = f
shift a i f = shift a (i-1) (f++['0'])


cal a b mul 0 n = 
	if(b!!(n-1)=='1') then
		cal a b (adder (rev mul []) [] (rev (two_com (shift a 0 []) []) []) 0) (1) (n)
	else
		cal a b mul (1) (n)

cal a b mul i n= 
	if(i /= n) then
		if (b!!(n-1-i) == b!!(n-i)) then
			cal a b mul (i+1) n
		else if (b!!(n-1-i) == '1')&&(b!!(n-i)=='0') then
			cal a b (adder (rev mul []) [] (rev (two_com (shift a i [] ) []) []) 0) (i+1) n
		else 
			cal a b (adder (rev mul []) [] (rev (shift a i [] ) [] ) 0) (i+1) n
	else
		mul


main = do
	putStrLn "Enter number of Bits:"
	n <- getChar
	e <-getLine
	putStrLn "Enter two numbers:"
	--let a = ['0','0','1'];
	a <- getLine
	--let b = ['0','0','0'];
	b <- getLine
	let d = digitToInt n
	let c = cal a b ['0'] 0 (digitToInt n);
	putStrLn c