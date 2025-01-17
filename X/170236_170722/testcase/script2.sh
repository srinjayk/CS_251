#!/bin/bash
#Give the C file name
echo "Give the C file name: "
read C_file_name
C_file=$(echo $C_file_name | sed s/'\.c'//g)
#Give the test case file name
echo "Give the test file: "
read test_case

rm -f result temp gen_out final_file run gmon.out result2.csv

################################## CODE FOR GPROF ##############################

gcc -pg $C_file.c -o run
touch result2.csv
touch temp
touch gen_out

while IFS="" read -r line; do

	./run $line > temp
	# echo $line | ./run > temp
	#incase a program dont need any input just give a enter in test_case.txt
	#(used for given test_case i.e. tcas.c)or we can use echo $line | ./run(used for general programe)
	echo $line
	#<-----we can also end the all possible execution here by ending the above while loop but
	#then we would just get the last output.Not all the map of call graph and would show only the last state of gprof.
 	touch final_file

	gprof -b -c -q  ./run | tail -n +7 | head -n -5 |  sed s/"index %"//g | sed s/"self"//g | sed -E s/" [[:digit:]]*\.[[:digit:]]? "/"     "/g > temp

	flag=0

	while IFS= read -r -d $'\n' item;
	do
		if [ $(echo $item | grep -E "\[[[:digit:]]\] " | wc -l) -ge 1 ];
		then
			flag=1
		fi
		if [ "$item" == "-----------------------------------------------" ]; then
			echo $item >> final_file
			flag=0
		fi
		if [ $flag -ge 1 ];
		then
			echo $item >> final_file
		fi
	done < temp

	cat final_file | sed s/'main'/'*  main'/g | sed -E s/"\[[[:digit:]]\]?"//g | awk '{print $4","$1}' > gen_out

	flag=1
	for item in $(cat gen_out);
	do
			if [ "$item" == ",-----------------------------------------------" ]; then
	                flag=1
	        else
			if [ $flag -eq 2 ];
			then
	        		echo $base_string","$item	>> result2.csv
	        		flag=0
	        fi
			if [ $flag -eq 1 ];
			then
					base_string=$item
					flag=2
			fi
	        fi
	done
	rm final_file
 done < $test_case
rm -f gmon.out

rm -f temp final_file run result gen_out a.out
