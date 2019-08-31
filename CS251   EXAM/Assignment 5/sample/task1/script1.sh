#!/bin/bash
#Give the C file name
echo "Give the C file name: "
read C_file_name
C_file=$(echo $C_file_name | sed s/'\.c'//g)
#Give the test case file name
echo "Give the test file: "
read test_case

gcc -fprofile-arcs -ftest-coverage $C_file.c
touch output1
while IFS="" read -r list; do
echo $list | ./a.out > output1
done < $test_case
#need to give enter at last line for execution of test_case file
############################### CODE FOR FREQUENCY EXECUTION ###################################

touch output2
gcov $C_file.gcno > output2
rm -f output1 output2

touch output
tail -n +6 $C_file.c.gcov > output
iter=$(wc -l output)

touch result.csv
echo "Line_number,execution_frequency" > result.csv
echo "" >> result.csv
awk '{print $2 " ," $1}' output | sed s/":.* "//g | sed s/":.*"//g >> result.csv

############################# CODE FOR BRANCH BIAS ##################################

echo "" >> result.csv
echo "Branch_line_number,bias" >> result.csv
echo "" >> result.csv
gcov -b $C_file.gcno > output
fgrep -n "branch" $C_file.c.gcov | awk '{print $1 " " $2 " " $4}' | sed s/:/' '/g | awk '$3==1{print $2 " " $3 ","$4/100}' >> result.csv
rm -f $C_file.gc* $C_file.c.gcov output a.out
