#!/bin/bash

git add --all

git commit -m "$1"

git push origin master

echo "******************************"
echo "GIT ACTIONS HAVE BEEN FINISHED"
Echo "******************************"

