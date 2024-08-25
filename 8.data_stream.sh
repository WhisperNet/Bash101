#!/bin/bash

ls -l
echo "The above output is an example of standard output with exit code $?"

ls /doesNotExistDir
echo "The above output is an example of standard error with exit code $?"


find /etc -type f
echo "this will show both satndard output and error"

find /etc -type f 2> /dev/null   # specifying nothing/1 standard output, 2 standard error
echo "this will only show standard output and redirect the error to the void"

find /etc -type f > /dev/null   # specifying nothing/1 standard output, 2 st>
echo "this will only show standard error and redirect the output to the void"

find /etc -type f &> /dev/null   # & -> redirect everything 
echo "this will show nothing "

find /etc -type f 1>result.txt 2>error.txt


echo "this is an example of stndard input."
echo "Your input:"
read input
echo "Your input $input"
