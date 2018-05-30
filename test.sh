#!/bin/bash

if [ $# -eq 0 ]; then
    echo "please enter a file"
    exit 1
fi

cat $1 >> $0
if [ $1 = "hello" ]; then
    echo "hey, what's up"
else
    echo "...hi?"
fi
