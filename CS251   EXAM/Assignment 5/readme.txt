170736 Deepesh Kumar Lall
170722 Srinjay Kumar

Instrutions for sample
----------------------

There are two folders in this folder.


Folder::Sample
--------------
"task1" contains the gcov file.
"result.csv" contains <Line_number,execution_frequency> and <Branch_line_number,bias> 
"a.txt" is the input file containing the '\n' character.

Instructions for execution
-------------------------
./script1.sh
Enter the C file name:: sum.c
Enter the name of input file :: a.txt

"task2" contains the gprof file.
"result.csv" contains <TestFunc,StaticFunc,main,TestFunc> in the format of <function1, time_spent_by_function1, function2,time_spent_in_function2>
"a.txt" is the input file containing the '\n' character.

Instructions for execution
-------------------------
./script2.sh
Enter the C file name:: sum.c
Enter the name of input file :: a.txt



Folder::Testcase
----------------

This folder contains two scripts: "script1.sh" and "script2.sh"
"script1.sh" executes gcov and "script2.sh" executes gprof
"testcase.txt" represents the testcases present on moodle.

Instructions for execution
-------------------------
./script1.sh
Enter the C file name:: tcas.c
Enter the name of input file :: testcase.txt
Output::result1.csv

./script2.sh
Enter the C file name:: tcas.c
Enter the name of input file :: testcase.txt
Output::result2.csv
Note:: We have appended all the cumulative outputs in the file result2.csv
