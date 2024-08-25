#!/bin/bash

var=htop

sudo apt install $var >> success.log  # redirect the output into the log

if [ $? -eq 0 ]    # $? stores the exit code of the last ran command 0 for scuccess
then
	echo "Successfully installed in"
	which $var
else
	echo "Something wen wrong" >> failure.log
fi


# ********************************************** #


var=~/doesNotExistDirectory

if [ -d $var ]
then
        echo "This directory does exist!"
else
        echo "This directory doesn't exist!"
fi

echo "Exit code $?"  # Still 0 . why ?


# ************************************************ #

var=~/doesNotExistDirectory

if [ -d $var ]
then
        echo "This directory does exist!"
	exit 0 				 #works as return 
else
        echo "This directory doesn't exist!"
	exit 1 				  #script will exit with the mentioned exit code
fi

echo "Exit code $?"  # this line will not be reached  

