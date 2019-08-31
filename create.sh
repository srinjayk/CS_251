gcc -c add.c -o add.o
gcc -c sub.c -o sub.o
ar rcs libas.a add.o sub.o
gcc -c -fPIC -o mpy.o mpy.c
gcc -c -fPIC -o div.o div.c 
gcc -shared -fPIC -o libmd.so mpy.o div.o
dir=$(pwd)
gcc -g -Wl,-rpath=$dir -o mathdemo_bin -I . -L . driver_static.c -lmd -las