#!/bin/bash

for n in 1 2 3 4 5
do
        echo $n
        sleep 0.2
done

echo "*********"

for n in {5..1}
do
	echo $n
	sleep 0.2
done


****************************************


mkdir logfiles
cp /var/log/*.log logfiles/

for files in logfiles/*.log
do
	tar -czvf $files.tar.gz $files 
done
