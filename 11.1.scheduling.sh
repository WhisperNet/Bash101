#!/bin/bash

if ! command -v at &> /dev/null
then
	echo "Please wait. installing [at] command"
	sudo apt install at &> /dev/null
	$? || exit 1 # if previous exit code is non zero exit with 1
fi

#get the current time in HH:MM format
current_time=$(date +%H:%M)

#get the next minute time from now in HH:MM format
next_minute=$(date -d "$current_time 1 minute" +%H:%M)

#piping the comand to at
echo "echo "This ran after 1 minute at $next_minute" >> jobTime.log " | at $next_minute

#Running it with the hep of <<
at 18:00 081630  << EOF
	echo "This will run in the year 2030!"
EOF

if [ -f script.sh ]
then
        at 18:00 081622 -f script.sh
fi

while true
do
	echo "This is the current at queue:"
	atq
	echo "run atrm [posotion in queue] to delete a job"
	read -p "Enter atrm [int] to remove a job from queue, q to quit:  " user_input
	if [ "$user_input" = "q" ]
	then
		break
	#The double square brackets [[]] are used in Bash for conditional expressions and provide some advantages over the single brackets []
	elif [[ "$user_input" =~ ^atrm[[:space:]]+[0-9]+$ ]] 
	then
	eval $user_input
	else
		echo "Invalid command. Please use 'atrm [number]' or 'q' to quit."
	fi
	sleep 2
done
