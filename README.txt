Group : 20
Deepesh Kumar Lall
170236
Srinjay Kumar
170722

Every segment of the code is commented and all the utility function have been used clearly.The data tyoe of all normal and monadic function have been mentioned clearly in the code itself and have been shown for all the possible cases.

To compile the program use command :
ghc -o haskell haskell.hs

After compling and linking we can run the haskell code by command:
./haskell

In the code we ask for no of bits as input, and 2 input corresponding to those 2 inputs.
Incase in either of the 2 inputs no of zeros and no of ones are equal we assume our adder become faulty and an error message throws out while otherwise we print all the step wise state of all registers i.e. accumulator  multiplier and qn+1 we keep generating the result inside a string and finally prints it.

While in case of multiplication result we return the last value of the acccumulator and multiplier.

We have strictly followed the booths algorithm as mentioned in geeks for geeks as recommended.