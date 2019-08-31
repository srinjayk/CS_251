wget http://static.cricinfo.com/rss/livescores.xml


cat livescores.xml | awk -F'>' '{print $2}' | awk -F'<' '{print $1}' >>output.txt

grep "India" output.txt >>output5.txt

cat output5.txt
>output5.txt
rm livescores.xml





filename=$(basename -- "$fullfile")
extension="${filename##*.}"
filename="${filename%.*}"

if [ "$x" = "valid" ]; then
  echo "x has the value 'valid'"
fi


while [ 1 ];
do
    count=`curl -s "www.nba.com" | grep -c "Basketball"`

    if [ "$count" != "0" ]
    then
       echo "www.nba.com updated!"
       exit 0
    fi
    sleep 600
done
