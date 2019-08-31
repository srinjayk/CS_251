#!/bin/bash

gcc -g -c add.c sub.c

ar rcs libas.a add.o sub.o

rm add.o sub.o

gcc -c -g mpy.c div.c

gcc -g -fPIC -Wall -shared mpy.o div.o -o libmd.so

rm mpy.o div.o

#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:~$PWD

gcc -c -g code.c
gcc -g -Wall -Wl,-rpath=$PWD code.o -o runme -L. -lmd -L. -las -I .
rm code.o