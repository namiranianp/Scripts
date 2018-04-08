#!/bin/bash
chmod +x '~/Code/Scripts/' $1 '.sh';
echo "Testing success of compile...";
~/Code/Scripts/$1.sh
