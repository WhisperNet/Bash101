#!/bin/bash

#if [ -d /etc/pacman.d ]
#then
	#for arch/arch based distros
#	sudo pacman -Syu
#elif [ -d /etc/apt ]
#then
	#for debian/debian based linux
#	sudo apt update
#	sudo apt dist-upgrade
#else
#	echo "Can't determine the distro"
#fi


# ******************************************* #


release_file=/etc/os-release
logfile=/var/log/updater.log
errorlog=/var/log/updater_error.log

check_exist_status() {
	if [ $? -ne 0 ]
        then
                echo "An error occured . Check $errorlog"
        fi
}

if grep -q "Arch" $release_file
then
        #for arch
        sudo pacman -Syu 1>>$logfile 2>>$errorlog
	check_exist_status

elif grep -q "Ubuntu" $release_file || grep -q "Mint" $release_file
then
        #for ubuntu
        sudo apt update 1>>$logfile 2>>$errorlog
	check_exist_status
        sudo apt dist-upgrade 1>>$logfile 2>>$errorlog # add -y
	check_exist_status

else
        echo "Can't determine the distro"
fi

echo "Script ran successfully check $logfile"

