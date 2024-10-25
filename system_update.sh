#FIRST OF ALL WE WILL CREATE A BASH FILE IN NANO (LIGHT WEIGHT EDITOR) 

#first command will be
nano disk_usage_monitor

# now we will write the code in nano editor

#!/bin/bash

#system update script

#log file location
LOG_FILE="/var/log/system_update.log"

#update package list 
echo "$(date +'%Y-%m-%d %H:%M:%S'): updating package list..." | tee -a "$LOG_FILE"
sudo apt-get update >> "$LOG_FILE" 2>&1

#upgrade installed packages
echo "$(date +'%Y-%m-%d %H:%M:%S'): upgrading installed package..." | tee -a "$LOG_FILE"
sudo apt-get upgrade -y >> "$LOG_FILE" 2>&1

#optionally clean up unused packages
echo "$(date +'%Y-%m-%d %H:%M:%S'): cleaning up unused package..." | tee -a "$LOG_FILE"
sudo apt-get autoremove -y >> "$LOG_FILE" 2>&1
sudo apt-get clean >> "$LOG_FILE" 2>&1

#check for errors in the update process
if [ $? -eq 0 ]; then
    echo "$(date +'%Y-%m-%d %H:%M:%S'): system update completed successfully." | tee -a "$LOG_FILE"
else
    echo "$(date +'%Y-%m-%d %H:%M:%S'): system update encountered errors!" | tee -a "$LOG_FILE"
fi


#now save the file (ctrl + o) and exit

#now you will be returned to the terminal 
#before running the file we need to to provide the rights to execute to this file

chmod +x disk_usage_monitor.sh #chmod is used to provide the required rights and (+x) is the addition of execution rights.

#now we will run the file 
./disk_usage_monitor.sh

# if any error occur regarding the permission then run using the sudo command
sudo ./disk_usage_monitor.sh
