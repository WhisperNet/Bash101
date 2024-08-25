#!/bin/bash

lines=$(ls -lh $1 | wc -l)

if [ $# -ne 1 ]
then
    echo "This script takes exactly one args"
    exit 1
fi

if [ $lines -eq 0 ]
then
    exit 1
fi

echo "You have $(($lines-1)) objects in the the $1 dir"
