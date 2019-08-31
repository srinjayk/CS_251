dir=$(pwd)
export LD_LIBRARY_PATH=$(pwd)
str="gdb -ex 'break add' -ex 'break sub' -ex 'break mpy' -ex 'break div' -ex 'r <"$dir"/test.txt'"
var=$(wc -l < test.txt)
var=$(($var+1))
while [ $var -gt 0 ] 
do
	str=$str" -ex 'step' -ex 'info all-registers' -ex 'continue'"
	var=$(($var-1))
done
str=$str" -ex 'q' mathdemo_bin"
eval "$str"