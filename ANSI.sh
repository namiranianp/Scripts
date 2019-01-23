#!/bin/bash

for (( i=0; $i < 256; i=$(($i+1)) )); do
    echo -e "\033["$i"m This is what happens with "$i"m\033[0m"
done
