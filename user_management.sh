#FIRST OF ALL WE WILL CREATE A BASH FILE IN NANO (LIGHT WEIGHT EDITOR) 

#first command will be
nano user_management


# now we will write the code in nano editor

#!/bin/bash

#user management script

#function to display usage/help

function show_help() {
        echo "user management script"
        echo "usage:"
        echo " $0 add <username> <group> - add a new user"
        echo " $0 delete <username> - delete a user"
        echo " $0 lock <username> - lock a user account"
        echo " $0 unlock <username> - unlock a user account"
        echo " $0 help - show this help message"
}

#main script logic
if [ $# -eq 0 ]; then
    show_help
    exit 1
fi
#capture the first argument (command)
COMMAND=$1
USERNAME=$2
GROUP=$3

case $COMMAND in
    add)
        if [ -z "$USERNAME" ] || [ -z "$GROUP" ]; then
            echo "error: you must specify a username and group."
            show_help
            exit 1
        fi
        echo "adding user $USERNAME..."
        sudo useradd -m -g "$GROUP" -s /bin/bash "$USERNAME"
        sudo passwd "$USERNAME"
        echo "user $USERNAME added to group $GROUP."
        ;;
    delete)
        if [ -z "$USERNAME" ]; then
            echo "error: you must specify a username."
            show_help
            exit 1
            
            fi
            echo "unlocking user $USERNAME..."
            sudo usermod -U "$USERNAME"
            echo "user $USERNAME has been unlocked."
            ;;
        help)
            show_help
            ;;
        *)
            echo "error: invalid command."
            show_help
            exit 1
            ;;
esac

#now save the file (ctrl + o) and exit

#now you will be returned to the terminal 
#before running the file we need to to provide the rights to execute to this file

chmod +x user_management.sh #chmod is used to provide the required rights and (+x) is the addition of execution rights.

#now we will run the file 
./user_management.sh

# if any error occur regarding the permission then run using the sudo command
sudo ./user_management.sh




