#FIRST OF ALL WE WILL CREATE A BASH FILE IN NANO (LIGHT WEIGHT EDITOR) 

#first command will be
nano service_monitor

# now we will write the code in nano editor

#!/bin/bash

#service monitoring script

#list of services to monitor
SERVICES=("apache2" "mysql" "ssh")

#log file for the script
LOG_FILE="/var/log/service_monitor.log"

#function to check the status of each service
check_service() {
    local service=$1

    #check if the service is running
    if systemctl is-active --quiet "$service"; then
        echo "$(date +'%Y-%m-%d %H:%M:%S'): $service is running." | tee -a "$LOG_FILE"
    else
        echo "$(date +'%Y-%m-%d %H-%M-%S'): $service is not running. Attempting to restart..." | tee -a "$LOG_FILE"
        #attempt to restart the service
        sudo systemctl start "$service"
        #check if restart was successful
        if systemctl is-active --quiet "$service"; then
            echo "$(date +'%Y-%m-%d %H:%M:%S'): $service successfully restarted." | tee -a "$LOG_FILE"
        else
            echo "$(date +'%Y-%m-%d %H:%M:%S'): failed to restart $service!" | tee -a "$LOG_FILE"
        fi
    fi
}

#loop through each service and check its status
for service in "${SERVICES[@]}"; do
    check_service "$service"
done


#now save the file (ctrl + o) and exit

#now you will be returned to the terminal 
#before running the file we need to to provide the rights to execute to this file

chmod +x service_monitor.sh #chmod is used to provide the required rights and (+x) is the addition of execution rights.

#now we will run the file 
./service_monitor.sh

# if any error occur regarding the permission then run using the sudo command
sudo ./service_monitor.sh
