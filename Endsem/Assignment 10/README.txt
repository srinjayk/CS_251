Group : 20
Name : Deepesh Kumar Lall
Roll : 170236
Name : Srinjay Kumar
Roll : 170722

1. Inorder to typecast the string we have used read command and with Int as attribute.

2. Have used foldl to implement the map function with ys as the accumulator and appending 
   (f y) in the accumulator which is a list. 
   As the result is reverse order mapped function we need to call and external reverse function to invert the list.

   Similarly To implement we have used fold l with same ys as the accumulator and compare y at  every step and in case of match we use to add it in the accumulator else continue.
   As the result is reverse order filtred function we need to call and external reverse function to invert the list.

3. myFoldl :: (a -> b -> a) -> a -> [b] -> a

   myFoldl f z xs = foldr step id xs z
    where step x g a = g (f a x)

   The above function is an imlementation of foldl in terms of foldr.
   It takes a function and an accumulator and a list and give the finally evaluated output value of accumulator.
   Then the first call to to the above function execute the first statement and foldr recusively opens the brakcet and as the brackets get nested we proceed with step value.Then finally we get step with first argument as the length of initial list.

   Then as step is defined it returns a function which will operate over the outter step function's arguments in defination of step and will keep one repeating.finally it will be a function which will opearate over the accumulator.

   The above algorithm is demonstrated in the code below.

   myFoldl (+) 0 [1, 2, 3]
	= (foldR step id [1, 2, 3]) 0                                     		// foldr will operate recursively 
	= (step 1 (step 2 (step 3 id))) 0                                		// As it will reach the base It would follow the defination of step and step 3 id a3 = (\a3 -> id ((+) a3 3))
	= (step 1 (step 2 (\a3 -> id ((+) a3 3)))) 0							// Similarly the output of above line will act itself as a function similar to id in previouse case keep repeating.
	= (step 1 (\a2 -> (\a3 -> id ((+) a3 3)) ((+) a2 2))) 0					
	= (\a1 -> (\a2 -> (\a3 -> id ((+) a3 3)) ((+) a2 2)) ((+) a1 1)) 0		// Once all of them are changed in terms of a1 a2 a3 can start eliminating a3 by substituting a2 at required places in 																				lambda function
	= (\a1 -> (\a2 -> (\a3 -> (+) a3 3) ((+) a2 2)) ((+) a1 1)) 0			
	= (\a1 -> (\a2 -> (+) ((+) a2 2) 3) ((+) a1 1)) 0						
	= (\a1 -> (+) ((+) ((+) a1 1) 2) 3) 0									// At last we will only have left a1 which will take the accumulator value i.e. zero.
	= (+) ((+) ((+) 0 1) 2) 3
	= ((0 + 1) + 2) + 3														// It's similar to left fold function operation.	

4. NUMBERS TO WORDS:
   In case of conversion from number to word we use to divide the number in fragments of 3 and zip it with hirerchy of thousand,million,trillion etc.
   Then we use to keep dividing and taking mod and generating the string till wherever possible.
   We have defined the required list first by names on ONES TEEENS TENS and GROUPS.
   Then we used use the function to change number in each groups in words when required.
   splitNum function divide the number in groups of three.
   Then toWordGroups function makes a list of each group number as list of strings.
   newIntersperse is same as intersperse but for list of string.(i.e. remove comma from each touple of strings)
   numToWords is the final function which converts a number into words.

   WORDS TO NUMBER:
   In this case we use to convert a string in corresponding function.
   Here we have used the map list of tuples for ONES TEN TEENS and GROUPS.
   While wordListToNum is an utility function which makes number from list of strings and on accounting a "hundred" it moves pointer ptr up 2 level while on accounting any word from MappedGroup it moves the pointer to the required mapped power of mappedGroup and keep on adding the numbers.
   wordToNum is the main function which changes the string into the number.
   clean,cleanHelper and removePunc are utility function to remove "and , . -" and provide the stream of string as the desired list to the wordListToNum function.