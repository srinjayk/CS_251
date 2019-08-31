export LD_LIBRARY_PATH=.
touch result2.csv
echo -e "input,sort1,sort2" >| result2.csv
for((i=1;i<11;$((i++))))
do
	touch newf1
	echo $i >| newf1
	touch temp.txt
	0<newf1
	echo -e "break 25\n break 27\nrun\ninfo register rax\ncontinue\ninfo register rax\n continue\n quit">|gdbscript
	gdb -q -x gdbscript prog <newf1 >temp.txt
	f1=`cat temp.txt | grep rax |sed -E 's/[[:space:]]+/,/g' | cut -d ',' -f 3 |head -n+1`
	f2=`cat temp.txt | grep rax |sed -E 's/[[:space:]]+/,/g'| cut -d ',' -f 3 |tail -n+2`
	echo -e "$i,$f1,$f2" >> result2.csv
	rm newf1
	rm temp.txt
done
