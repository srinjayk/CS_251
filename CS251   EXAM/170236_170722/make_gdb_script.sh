#!/bin/bash
touch gdb_script.gdb
echo "break add">gdb_script.gdb
echo "break sub">>gdb_script.gdb
echo "break mpy">>gdb_script.gdb
echo "break div">>gdb_script.gdb
echo "start">>gdb_script.gdb
echo "info breakpoints">>gdb_script.gdb

itr=$(cat input.txt | wc -l)
while [ $itr -gt 0 ]
do
	echo "continue">>gdb_script.gdb
	echo "info all-registers">>gdb_script.gdb
	itr=$(($itr-1))
done
echo "quit">>gdb_script.gdb
