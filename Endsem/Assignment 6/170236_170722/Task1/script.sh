#!/bin/bash
#Give the C file name
echo "Give the C file name: "
read C_file_name
C_file=$(echo $C_file_name | sed s/'\.c'//g)
#Give the test case file name
echo "Give the test file: "
read test_case

rm -f output1 output2 line_result.csv branch_result* a.out output1 result.csv

file_number=1

echo "Line_number,Bias,Input_number" > result.csv

while IFS="" read -r list; do
	echo $list
	echo "-----------------------------------------------------------------------------------------------------------------AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
	gcc -fprofile-arcs -ftest-coverage $C_file.c 1>/dev/null

	eval "./a.out $list"

	#need to give enter at last line for execution of test_case file
############################### CODE FOR FREQUENCY EXECUTION ###################################
	
	#touch output2
	#gcov $C_file.gcno > output2
	
	touch output
	#tail -n +6 $C_file.c.gcov > output
	iter=$(wc -l output) #no of line in C code
	
	#touch result.csv
	#echo "Line_number,execution_frequency" > line_result.csv
	#awk '{print $2 " ," $1}' output | sed s/".*,#####"/@/g | sed s/".*,-"/@/g | sed s/":.* "//g | sed s/":.*"//g | awk '{if ($1!="@") print $1}'>> line_result$file_number.csv
	
############################# CODE FOR BRANCH BIAS ##################################

	#echo "" >> result.csv
	#echo "Branch_line_number,bias" >> result.csv
	#echo "" >> result.csv
	gcov -b $C_file.gcno > output
	fgrep -n "branch" $C_file.c.gcov | awk '{print $1 " " $2 " " $4}' | sed s/:/' '/g | awk '$3==0{print $1 " "$4/100}' > branch_result
	
	awk '{print $2}' branch_result > branch_result2
	awk '{print $1}' branch_result > branch_result1
	
	itr=1
	
	
	for i in $(cat branch_result1);do 
		var=$(head -n $(($i-1)) $C_file.c.gcov | tail -n -1 | awk '{print $2}' | sed s/://g)
		var2=$(head -n $itr branch_result2 | tail -n -1)
		itr=$(($itr+1))
		echo "$var,$var2,$file_number" >> result.csv
	done

	rm -f a.out $C_file.gc* branch_result1 branch_result2 branch_result* $C_file.c.gcov
	file_number=$(($file_number+1))
	if [ $file_number == 6 ];then
		break
	fi
done < $test_case

rm -f output

Rscript rscript.r
