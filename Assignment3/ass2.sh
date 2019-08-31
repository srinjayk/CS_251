while(1)
{
    wget http://static.cricinfo.com/rss/livescores.xml
    cat livescores.xml | awk -F'>' '{print $2}' | awk -F'<' '{print $1}' >>output.txt
    grep "India" output.txt >>output5.txt
    cat output5.txt
    >output5.txt
    rm livescores.xml
}
