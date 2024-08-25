#!/bin/bash

RED='\e[31m'
GREEN='\e[32m'
YELLOW='\e[33m'
RESET='\e[0m'

if [ $# -ne 2 ]
then
    echo -e "${RED}Usage: backupscript.sh <source_dir> <target_dir>"
    echo -e "Try again ${RESET}"
    exit 1
fi

# Check to see if rsync is installed
if ! command -v rsync > /dev/null 2>&1
then
    echo -e "${RED}This script is dependent on the package rsync${RESET}"
    echo -e "${YELLOW}Trying to install rsync.....${RESET}"
    if sudo apt install -y rsync || \
    sudo dnf install -y rsync || \
    sudo yum install -y rsync || \
    sudo pacman -S --noconfirm rsync || \
    sudo zypper install -y rsync || \
    sudo apk add rsync || \
    sudo pkg install -y rsync
    then
        echo -e "${GREEN}rsync installed successfully.${RESET}"
    else
        echo -e "${RED}Failed to install rsync with any package manager.${RESET}"
        exit 2
    fi
fi

# Store the current date in the format YYYY-MM-DD
current_date=$(date +%y-%m-%d)
rsync_options="-avb --backup-dir $2/$current_date --delete"
$(which rsync) $rsync_options --dry-run $1 $2/current >tmp_$current_date.log

echo -e "${YELLOW}The following changes will be applied:${RESET}"
cat tmp_$current_date.log
echo -e "Enter ${GREEN}y${RESET} to ${GREEN}apply${RESET}. ${RED}q${RESET} to ${RED}quit${RESET}"

while true
do
read user_input
    case $user_input in
        y) 
            if $(which rsync) $rsync_options $1 $2/current > backup_$current_date.log
            then
                echo -e "${GREEN}Success${RESET}"
            else
                echo -e "${RED}Something went wrong.Be sure to enter valid directories${RESET}"
	    fi
            rm tmp_$current_date.log
            break;;
        q) 
            echo -e "${RED}Backup was not applied${RESET}"
            break;;
        *) 
            echo -e "Enter ${GREEN}y${RESET} to ${GREEN}apply${RESET}. ${RED}q${RESET} to quit."
    esac
done

