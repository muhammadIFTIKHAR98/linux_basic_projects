FIRST OF ALL WE WILL CREATE A BASH FILE IN NANO (LIGHT WEIGHT EDITOR) 

#first command will be
nano service_status

# now we will write the code in nano editor


#!/bin/bash

#service status check script

#define the services you want to check
SERVICES=("apache2" "mysql" "ssh")

#email address to send notification

EMAIL="iftikharidrisi0786@gmail.com"

#loo[ through the services and check their status
for SERVICE in "${SERVICES[0]}"; do
    if systemctl is -active --quiet "$SERVICE"; then
        echo "$SERVICE is running"
    else
        echo "$SERVICE is not running"
        echo "$SERVICE on $(hostname) is down!" | mail -s "service alert: $SERVICE down" "$EMAIL"
    fi
done

#now save the file (ctrl + o) and exit

#now you will be returned to the terminal 
#before running the file we need to to provide the rights to execute to this file

chmod +x service_status.sh #chmod is used to provide the required rights and (+x) is the addition of execution rights.

#now we will run the file 
./service_status.sh

# if any error occur regarding the permission then run using the sudo command
sudo ./service_status.sh
