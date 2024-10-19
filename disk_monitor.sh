#FIRST OF ALL WE WILL CREATE A BASH FILE IN NANO (LIGHT WEIGHT EDITOR) 

#first command will be
nano disk_monitor

# now we will write the code in nano editor


#!/bin/bash

#disk usage monitoring script

#threshold for disk usage (in percentage)

THRESHOLD=80

#email for notification (optional)
EMAIL="iftikharidrisi0786@gmail.com"

# log file for disk usage warnings
LOG_FILE="/var/log/disk_monitor.log"

#get the current disk usage of the root partition
DISK_USAGE=$(df / | grep '/' | awk '{print $5}' | tr -d '%')

#get current date and time for logging
DATE=$(date +'%Y-%m-%d %H:%M:%S')

#ensure the disk_usage is not empty or null
if [[ -z "$DISK_USAGE" ]]; then
    echo "$DATE: unable to retrieve disk usage." | tee -a "$LOG_FILE"
    exit 1
fi

#check if the disk usage exceeds the threshold
if [[ "$DISK_USAGE" -ge "$THRESHOLD" ]]; then
   # log the warning
   echo "$DATE: disk usage is critically high: $DISK_USAGE%" | tee -a "$LOG_FILE"

   # send an email alert (optional)
   echo "warning: disk usage on the system ahs exceeded $THRESHOLD%. current usage is  $DISK_USAGE%." | mail -s "disk usage warning" "$EMAIL"
else
   #log naromal usage
   echo "$DATE: disk usage is normal: $DISK_USAGE%" >> "$LOG_FILE"
fi

#now save the file (ctrl + o) and exit

#now you will be returned to the terminal 
#before running the file we need to to provide the rights to execute to this file

chmod +x disk_monitor.sh #chmod is used to provide the required rights and (+x) is the addition of execution rights.

#now we will run the file 
./disk_monitor.sh

# if any error occur regarding the permission then run using the sudo command
sudo ./disk_monitor.sh
