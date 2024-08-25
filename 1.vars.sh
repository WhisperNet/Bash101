#!/bin/bash

examplevar="whisper" # Varibale -> use lowercase from shell vars , there should be no space before and after the = sign declaring the var

echo "$examplevar will be evaluated"

echo '$examplevar will not be evaluated'

cureentdirfiles=$(ls) # SUbSHELL->Sends the command in the background 

echo "$cureentdirfiles"

now=$(date)

echo "current system date & time $now"

echo "Hi $USER" # Default Variable/ Environment vars -> use uppercase 

echo "**********************************"
echo "Printing all the ENVIRONMENT vars"
echo "**********************************"

env
