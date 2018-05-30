#!/bin/bash

for color in {0..255}; do
	tput setaf $color; echo "color is $color"
done

tput setaf 0;