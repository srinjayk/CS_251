c1="A B C D E F G H I J K L M N O P Q R S T U V W X Y Z"
c2="a b c d e f g h i j k l m n o p q r s t u v w x y z"
c3="@ #"
c4="1 2 3 4 5 6 7 8 9 0"

for i in $c1
do
	for j in $c2
	do
		for k in $c3
		do
			for l in $c4
			do
				pass="${i}${j}${k}${l}"
				unzip -o -P "$pass" question.zip
				if [[ $? == 0 ]]
				then
					echo -e "$pass" >> pass.txt
					exit 0
				fi
			done
		done
	done
done
#Pass=Kp#7
