cat sample | awk '{print $1}' > filename
cat sample | awk '{print $2}' > permission
cat sample | awk '{print $3}' > location
cat filename 
cat permission
cat location

let "count = 0"

for item in $(cat filename);
do

	count=$((count+1))

	let "case_a = 0"
	let "case_b = 0"
	let "case_c = 0"
	let "case_d = 0"


	case_a=$(file $item | grep "PDF" | wc -l)

	case_b=$(file $item | grep "archive" | wc -l)

	case_c=$(file $item | grep "C source" | wc -l)

	echo $case_a $case_b $case_c
	echo $item

	if [ $case_a == 1 ] ; then
		case_final=1
	fi
	if [ $case_b == 1 ]; then
		case_final=2
	fi
	if [ $case_c == 1 ]; then
		case_final=3
	fi
	if [ $case_a == 0 ] && [ $case_b == 0 ] && [ $case_c == 0 ]; then
		case_final=4
	fi

	echo $case_final

	location=$(cat location | head -n $count | tail -1)
	echo $location

	permission=$(cat permission | head -n $count | tail -1)
	echo $permission

	read=$(echo $permission | grep "Read" | wc -l)
	write=$(echo $permission | grep "Write" | wc -l)
	execute=$(echo $permission | grep "Execute" | wc -l)

	echo $read $write $execute

	echo " "

done