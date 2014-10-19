#!/usr/bin/env bash
## This script should be used to compile and run helloflops1.bash

## With gcc
gcc -O3 -Wall -mavx helloflops1.c -o g_havx.x
gcc -O3 -Wall helloflops1.c -o g_h.x

## With icc
icc -O3 -xavx helloflops1.c -o i_havx.x
icc -O3 helloflops1.c -o i_h.x

# So far the speed to beat is 18.9 GFlops
