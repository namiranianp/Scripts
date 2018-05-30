#!/bin/bash

OUTFILE="temp.txt"

userNames=(
	"Hello"$'\n'"World"
	"world"
	"!"
	)

for var in ${userNames[@]}
do
	#execute homework command and put it into a file
	echo $var > $OUTFILE
	#move from file into variable
	fileText=$(<$OUTFILE)
	numLines=$(cat $OUTFILE | wc -l)
	echo ${numLines}
done

#removes the clutter when we don't need it
rm $OUTFILE