#!/bin/bash

echo "Enter a number between 1-3"

read choice0

case $choice0 in
	1) echo "every case will end with double semicolone";;
	2) echo "Multiple command"
	   echo "is also Valid !";;
	3) echo "A single semicolone" ; echo  "is equivalent to"
	   echo "A new line(This is applicable to all bash scripting in general)";;
	*) echo "Ctach all- All case statement ends with esac"
esac

#################################################

finish=0

while [ $finish -eq 0 ]
do
	echo "1)List all the items in this dir"
	echo "2)Make a test.txt file"
	echo "3)Remove the test.txt file"
	echo "Enter 5 to exit" 
	read choice
	
	case $choice in
		1) ls ;;
		2) touch test.txt ;;
		3) rm test.txt ;;
		5) finish=1;;
		*) echo "Please enter a valid choice"
	esac
done

echo "Script exit..."

