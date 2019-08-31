#!/bin/bash
echo "Give a file name for test:"
read sample
#sample file contains all the paths, permissions and files/directories
touch directory
#copies the first column in the directory file
cut -d " " -f 1 $sample > directory
#copies the second column in the permission file
touch permission
cut -d " " -f 2 $sample >  permission
#copies the content of the third file in the destination directory folder
touch destination_directory
cut -d " " -f 3 $sample > destination_directory

#initialising the value of the iteration
let "iter = 0"

for item in $(cat directory);
do
	#increasing the iteration each time
	iter=$((iter+1))
	if [ $(grep "$item" directory | wc -l) == 0 ]; then
		echo "file not found"
		continue
	fi

	#initialising the required variables
	let "case_final = 0"
	let "case_a = 0"
	let "case_b = 0"
	let "case_c = 0"

	#these variables will take euther 0 or 1 depending upon if we get the required keyword
	case_a=$(file $item | grep "executable" | wc -l)
	case_b=$(file $item | grep "PDF" | wc -l)
	case_c=$(file $item | grep "dyamically linked" | wc -l)
	case_c=$(file $item | grep "current ar archive" | wc -l)

	group=$(id -g -n)
	user=$(id -u -n)
	#sudo chown $user:$group $item
	#case 1 is for executable
	#if [ $case_a == 0 ] && [ $case_b == 0 ] && [ $case_c == 0 ] && [ wc -l == 0];  then
		#continue
	#fi
	if [ $case_a == 1 ]; then
		case_final=1
	fi
	#case 2 is for PDF
	if [ $case_b == 1 ]; then
		case_final=2
	fi
	#case 3 is for libraries
	if [ $case_c == 1 ];  then
		case_final=3
	fi
	#case 4 is for header
	if [ $case_a == 0 ] && [ $case_b == 0 ] && [ $case_c == 0 ];  then
		case_final=4
	fi

	location=""
	location=$(cat destination_directory | head -n $iter | tail -n 1)
	case "$case_final" in
		'1' )
		  location="$location/bin/"
		  mkdir -p $location
			group=$(id -g -n)
			user=$(id -u -n)
		  cp -p $item $location
		  # chown $user:$group "$location/$item"
		;;
		'2' )
		  location="$location/doc/"
		  mkdir -p $location
			group=$(id -g -n)
			user=$(id -u -n)
			cp -p $item $location
			# chown $user:$group "$location/$item"
		;;
		3)
		  location="$location/lib/"
		  mkdir -p $location
			group=$(id -g -n)
			user=$(id -u -n)
			cp -p $item $location
			# chown $user:$group "$location/$item"
		;;
		4)
		  location="$location/include/"
		  mkdir -p $location
			group=$(id -g -n)
			user=$(id -u -n)
			cp -p $item $location
			# chown $user:$group "$location/$item"
		;;
	esac

	item="$location/$item"
	touch file_access
	cat permission | head -n $iter | tail -n 1 > file_access

	#give no permission initially
	chmod u-rwx $item
	#change the permission in the required way as it is to be given
	if (( $(cat file_access | grep "Read" | wc -l) == 1 )); then
		chmod u+r $item
	fi
	if (( $(cat file_access | grep "Write" | wc -l) == 1 )); then
		chmod u+w $item
	fi
	if (( $(cat file_access | grep "Execute" | wc -l) == 1 )); then
		chmod u+x $item
	fi

done
rm directory permission destination_directory file_access
