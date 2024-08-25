#!/bin/bash

check_exit_status() {
    if [ $? -ne 0 ]
    then
        echo "An error occured "
    else
	echo "Success"
    fi
}


ls .
check_exit_status

ls /doesNotExist
check_exit_status
