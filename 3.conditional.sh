#!/bin/bash

# ********************************************** #

var=100

if [ ! $var -eq 150 ] # here ! negates the expression || other ops -ne , -gt, -lt
then
	echo "var does not equals to 150!"
else
	echo "var is equals to 150"
fi



# *********************************************** #

if [ -f ./conditional.sh ] # use -d for a directory !
then
	echo "the file conditional.sh exist"
fi


# *********************************************** #

command=/usr/bin/htop

if [ -f $command ]
then
	echo "Found the HTOP in your system, Running....."
else
	echo "HTOP not found , trying to install and then run..."
	sudo apt update && sudo apt install -y  htop   # -y -> dont need a confirmation to install the package
fi

$command


# *********************************************** #
# we don't need [ ] in conditional if we are not using tge test command shorthand [ ] ,, use man test for more info

command=htop

if command -v $command # command -v checks the existence of a command 
then
        echo "2.Found the HTOP in your system, Running....."
else
        echo "2.HTOP not found , trying to install and then run..."
        #sudo apt update && sudo apt install -y htop   # -y -> dont need a con>
fi

#$command

