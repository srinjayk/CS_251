wget "http://static.espncricinfo.com/rss/livescores.xml" >temp

#cat livescores.xml

touch match_list

cat livescores.xml | grep "\<title\>" >match_list

cat match_list | grep " v " >match_list1
cat match_list1 | grep "*" >match_list2
sed -e s/^\<title\>//g match_list2 >match_list3
sed -e s/\<.title\>$//g match_list3 >match_list4

read team_name

initial=$(cat match_list4| grep "$team_name")
#initial1=$(cat livescores.xml | grep -e ^\<title\>.*\</title\> | grep "$team_name" | sed -e s/^\<title\>// | sed -e s/\<.title\>$//)

#line=$($initial | wc -l)
notify-send "$initial"

rm match_list match_list1 match_list2 match_list3 match_list4


#cat match_list4

rm livescores.xml


while true ; do
	wget "http://static.espncricinfo.com/rss/livescores.xml" >temp
	touch match_list

	cat livescores.xml | grep "\<title\>" >match_list

	cat match_list | grep " v " >match_list1
	cat match_list1 | grep "*" >match_list2
	sed -e s/^\<title\>//g match_list2 >match_list3
	sed -e s/\<.title\>$//g match_list3 >match_list4

	

	final=$(cat match_list4| grep "$team_name")

	if [ "$final" != "$initial" ]; then
		notify-send "$final"
	fi
	initial=$(cat match_list4| grep "$team_name")

	rm match_list match_list1 match_list2 match_list3 match_list4



	rm livescores.xml
	sleep 10

done