#!/bin/bash

IFS=$'\n'

touch out

ps -e -o pid,command| grep -E ' /bin/*' | awk '{print $2 " " $1}' > out
#! this command separates the processes that occur in /bin directory and writes it in out
touch output_temp
touch output


cat out | head -n -1 | tail -n +2 > output_temp
ps -e -o pid,command| grep -E ' /usr/bin/*' | awk '{print $2 " " $1}' >> output_temp
#! this command separates the processes that occur in /usr/bin directory and writes it in output_temp

cat output_temp | head -n -1 > output

touch out_right

for path in $(awk '{print $1}' output); do
	ls -l $path | awk '{print $9  " "  $1 " " $2}' >> out_right
done
#!all the paths and there rights and number of links will be printed in out_right

touch result.txt
#!result.txt file will be created

join output out_right > result.txt
#!output and out_right are combined there by giving the final file in tabluar format

sed 's/ /,/g' result.txt > output2.txt
#!output2.txt file will contain all the data of result.txt in csv format

rm out output_temp out_right output result.txt
#!all the rest temporary files are deleted
