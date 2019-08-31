export LD_LIBRARY_PATH=.
touch result.csv
echo -e "input,sort1,sort2" >| result.csv
for((i=1;i<11;$((i++))))
do
	touch newf1
	echo $i >| newf1
	./prog <newf1
	touch analysis.txt
	gprof -b -p prog >analysis.txt
	f1=`cat analysis.txt | grep sort1 |sed -E 's/ +/,/g' | cut -d ',' -f 3`
	f2=`cat analysis.txt | grep sort2 |sed -E 's/ +/,/g' | cut -d ',' -f 3`
	echo -e "$i,$f1,$f2" >> result.csv
	rm analysis.txt
	rm newf1
done
