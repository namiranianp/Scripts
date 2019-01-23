#!/bin/bash
#this script allows the user to set up all of the aliases and scripts in the desired
#location via commands given when calling setup.sh or through a text interface

main() {
	local continue

	if [ "$1" = "-C" ]; then
		if [ $# -lt 3 ]; then
			printHelp
			exit 1
		fi
		#do command stuff
		commandsGiven "$@"
	elif [ "$1" = "-noC" ]; then
		#do no command stuff
		noCommandsGiven
	else
		printHelp
		exit 1
	fi

	echo -n "Would you like to delete the download folder? [Y/n]: "
	#TODO is this the right way?
	if [ "$continue" = "n" ]; then
		echo "setup is completed"
		exit 0
	elif [ "$continue" = "N" ]; then
		echo "setup is completed"
		exit 0
	else
		local myDir
		myDir=$(pwd)
		rm -rf ${myDir%/*}
		echo "setup is completed"
	fi
}

printHelp() {
	echo "Usage: setup.sh -[C | noC] (Location to deposit Scripts folder) (Location of .bash_profile | .bashrc"
	echo "Please input -C if you are passing in commands and -noC if you would like the interactive interface"

}

#when given the commandline arguments this function will complete the setip
commandsGiven() {
	moveScripts "$2"
	appendBash "$3" "$2"
}

#Prompts the user for all of the information needed on what to set up and where
noCommandsGiven() {
	local continue

	echo "~~Welcome to the Bash Helper setup~~"

	echo -n "Enter the absolute path of where you want to store the scripts: "
	read scriptPath

	moveScripts "$scriptPath"

	echo "Enter the absolute path of your .bash_profile or .bashrc"
	read bashFile

	appendBash "$bashFile" "$scriptPath"
}

#appends whatever file it was given with the correct aliases, paths, and functions
#$1 is the path of the file that will be appended to
#$2 is the path of the 
#it is assumed that whatever file is a bashrc or bash_profile file, otherwise it is up to the
#user to make sure that their terminal accesses the files given
#if the file doesn't exist this will asume the user knows what they're doing and make the file
appendBash() {
	local fileLoc
	local scriptLoc

	#replaces ~ at start of path with their home directory
	if [ ${1%%/*} = "~" ]; then
		fileLoc="$HOME${1#~*}"
	fi

	#replaces ~ at start of path with their home directory
	if [ ${2%%/*} = "~" ]; then
		scriptLoc="$HOME${2#~*}"
	fi

	if ! [ -f "$fileLoc" ]; then
		touch "$fileLoc"
	fi

	echo "#Beginning of Bash Helper code" >> $fileLoc
	echo "#Setting path to the script files" >> $fileLoc
	echo "SCRIPTS=$scriptLoc" >> $fileLoc
	
	echo 'PATH=${PATH}:$SCRIPTS' >> $fileLoc
	echo "export PATH" >> $fileLoc
	echo "export SCRIPTS" >> $fileLoc
	echo ""  >> $fileLoc
	echo "#source for aliases" >> $fileLoc
	
	echo 'source $SCRIPTS/aliases.txt' >> $fileLoc
	echo "" >> $fileLoc
	echo "#Bash Helper functions" >> $fileLoc
	cat "$(pwd)/functions.txt" >> $fileLoc
}

#moves the scripts to the given path
#$1 is the path that we are moving to
#This will create a new folder called $path/Scripts, and if that already exists
#this will ask to delete it and write it's own directory
moveScripts() {
	local fileLoc

	#replaces ~ at start of path with their home directory
	if [ ${1%%/*} = "~" ]; then
		fileLoc="$HOME${1#~*}/Scripts"
	fi

	#check to see if the directory exists
	if [ -d "$fileLoc" ]; then
		echo "The file $fileLoc exists already, if you continue the existing file will be deleted"
		echo -n "Continue? [y/N]: "
		read continue

		#TODO fix this to ignore case
		#while [ 100 -gt 1 ]; do
		#	if [ -z "$continue" ]; then
		#		exit 0
		#	elif [ "$continue" = "n" ]; then
		#		exit 0
		#	elif [ "$continue" = "N" ]; then
		#		exit 0
		#	elif [ "$continue" = "y" ]; then
		#		echo "Continuing with setup"
		#		break
		#	else
		#		echo -n "please enter a valid option: [y/N]: "
		#		read continue
		#	fi
		#done

		#TODO is this the right way?
		if [ "$continue" = "y" ]; then
			echo "Continuing with setup"
		elif [ "$continue" = "Y" ]; then
			echo "Continuing with setup"
		else
			echo "Terminating setup"
			exit 1
		fi

		rm -rf "$fileLoc"
	fi

	mkdir "$fileLoc"

	for file in $(ls ..); do
		if [ ${file##*.} = "sh" ]; then
			echo "$file"
			cp "../$file" "$fileLoc"
		fi
	done

	cp "aliases.txt" "$fileLoc"
}

main "$@"