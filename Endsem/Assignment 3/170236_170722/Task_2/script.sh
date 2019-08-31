#!/bin/bash

touch temp
# a file named temp is declared
wget static.espncricinfo.com/rss/livescores.xml -o temp
# we download the rss feeds from the espn cricinfo website
rm -r temp
# removing the file temp
touch list
touch live_match_list
#two new files list and live_match_list are declared
cat livescores.xml | grep -e ^\<title\>.*\</title\> > list
# output the lines containing <title> tag in the list file
#rm -r livescores.xml

sed -e s/^\<title\>// list | sed -e s/\<.title\>$// | tail -n +2 > live_match_list
#replace the <title> tag

rm -r list

echo "CURRENT MATCH LIST:"
echo "-----------------------------------------------------------------"
cat live_match_list
#print out the current match list
rm live_match_list
echo "-----------------------------------------------------------------"
echo "Give a Team Name for Desktop Notification:"
read team_name
# the user will enter the matches he is interested in
#we need to filter the live matches from rss if posssible
#running an infinite loop
initial=$(cat livescores.xml | grep -e ^\<title\>.*\</title\> | grep "$team_name" | sed -e s/^\<title\>// | sed -e s/\<.title\>$//)
rm -r livescores.xml
notify-send "$initial"
while true; do
	touch temp
	wget static.espncricinfo.com/rss/livescores.xml -o temp
	rm temp
	notification=""
	final=$(cat livescores.xml | grep -e ^\<title\>.*\</title\> | grep "$team_name" | sed -e s/^\<title\>// | sed -e s/\<.title\>$//)
	notification=$(cat livescores.xml | grep -e ^\<title\>.*\</title\> | grep "$team_name" | sed -e s/^\<title\>// | sed -e s/\<.title\>$//)
	#notification is defined
	if [ "$final" != "$initial" ]; then
		#echo $final
		notify-send "$final"
	fi
	initial=$(cat livescores.xml | grep -e ^\<title\>.*\</title\> | grep "$team_name" | sed -e s/^\<title\>// | sed -e s/\<.title\>$//)

	# we send the notifications to the desktop
	rm livescores.xml
	sleep 10
	# interval of 10 seconds
done
