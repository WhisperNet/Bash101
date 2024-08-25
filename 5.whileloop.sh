#!/bin/bash

myvar=1

while [ $myvar -le 10 ]
do
	echo "Starting the healthcheck in $myvar...."
	#The $myvar+1 is an expression and per the syntax described in the manual for expr or in the earlier examples
	#you'd need to use expr to let bash know that you are attempting to perform an arithmetic operation. 
	#Using () around it, negates the use of expr.
	myvar=$(( $myvar+1 ))
	sleep 0.2
done


# ******************************* #

touch test
echo "Created a file named test"

while [ -f ./test ]
do
	echo "As of $(date) the test file exist"
	echo "run rm test"
	sleep 2
done

echo "testfile removed"
