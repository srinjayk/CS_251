#!/bin/bash
string="gdb -ex 'break add' -ex 'break sub' -ex 'break mpy' -ex 'break div' -ex 'start' -ex 'info breakpoints' "
itr=$(cat input.txt | wc -l )
while [ $itr -gt 0 ]
do
	string=$string"-ex 'continue' -ex 'info all-registers' "
	#we could have used print a then print b in place of info all-registers to give the value of variable stored when function is entered.
	itr=$(($itr-1))
done
string=$string"-ex 'quit' -ex 'y' ./runme"
eval $string
