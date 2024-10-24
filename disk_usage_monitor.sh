#FIRST OF ALL WE WILL CREATE A BASH FILE IN NANO (LIGHT WEIGHT EDITOR) 

#first command will be
nano disk_usage_monitor

# now we will write the code in nano editor

#!/bin/bash

#disk usage monitoring script

#set threshold for disk usage  (e.g., 70%)
THRESHOLD=70


#check the disk usage of mounted filesystems
df -H | grep -vE '^filesystem|tmpfs|cdrom' | awk '{ print $5 " " $1 }' | while read output; do

        #extract the usage percentage and the partition name
        USAGE=$(echo $output |awk '{ print $1}' | sed 's/%//g' )
        PARTITION=$(echo $output |awk '{ print $2}')

        #if the usage exceeds the threshold, send an alert
        if [ $USAGE -ge $THRESHOLD ]; then
           echo "warning: $PARTITION is at $USAGE% capacity"
        fi
done

#now save the file (ctrl + o) and exit

#now you will be returned to the terminal 
#before running the file we need to to provide the rights to execute to this file

chmod +x disk_usage_monitor.sh #chmod is used to provide the required rights and (+x) is the addition of execution rights.

#now we will run the file 
./disk_usage_monitor.sh

# if any error occur regarding the permission then run using the sudo command
sudo ./disk_usage_monitor.sh
