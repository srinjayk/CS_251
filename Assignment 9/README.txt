Group 	:20
Name 	:Deepesh Kumar Lall
Roll	:170236
Name	:Srinjay Kumar
Roll	:170722

We have implemented the 2 utility function for solvong the cipher text as mentioned in question i.e. frequency table generator and dictionary lookup.
There are many utility functions and main function used for implementing the above 2 things.The 2 major function as asked in question are below:

1.sortedList function at line 4 is the frequency table generator.
2.dictionaryLookup function at line 67 is the dictionary lookup function which return true if element is found in the dictionary else false.

We have also implement few other function to implement the deciphering process such as :

1.wordMatch at line 8 takes 2 string and tells the number of matching words in 2 string.
2.noOfMatchingWord at line 16 takes dictionary and a list of words and tells the number of words in list that are found in the dictionary.
3.Score function at line 24 is exactly same as noOfMatchingWord but it take a string and tells number of words of string present in dictionary,thereby act as parameter to judge readability of text.
4.joinString function at line 29 takes a string and strip out the \n and spaces from the string
5.improveScoreCheck  at line 47 takes the cipher text deciphers it according to the mapping and then tells the score of the cipher text.
6.decryptMessageHelper at line 53 is helper function for the decrypting function
7.decryptMessage at line 60 is the deciphering function that deciphers the ciphers according to previously assumed cipher mapping.
8.swapElementsAt at line 74 take 2 indices and swap the element at those 2 places in the list.
9.charMapping at line 83 is used as utility function for making the mapping of cipher's alphabet with the english alphabets.
10.makeMapping at line 96 is used for mapping the cipher text according to english alphabets frequency table.

Now our aim to make all the above function was to use the 7th function to decipher text and give the output.
And inorder to decipher the text we decided to alter the cipherList by swapping 2 selected indexes and modifying the cipherList which would eventually modify the mapping and change the decrypted message.We have also decided that we would only allow those swaps using function (8) which will increase the score measured by function (5),and thereby such modification would increase the readability of the text.

****************************************************************************************NOTE*************************************************************************************
1.We have used an initial random ordering in cipherList in accordance with the cipher text of question and have also commented the general english alphabets cipher order according to there frequency.(line 37-43)
2.We have no source of dictionary in format of list of haskell from internet so we have for now implemented a prototype dictionary at line 64.Please redefine it to check futher.
***********************************************************************************************************************************************************************************

BECEAUSE WE WERE NOT ABLE TO FIND WHAT ALGORITHM OR CHECK CONDITION TO USE INOREDER TO ALTER THE CIPHERLIST SUCH THAT OUR SCORE ALWAYS INCREASES AS INTENDED OUR  DECRYPT FUNCTION DOESN'T WORK,EXCEPT THE CIPHER TEXT GIVEN IN QUESTION.