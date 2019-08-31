gcc -g -Wall -fpic -c funcs.c
gcc -g -shared -o libop.so funcs.o
export LD_LIBRARY_PATH=.
./prog
