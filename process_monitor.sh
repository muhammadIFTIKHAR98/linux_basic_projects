#FIRST OF ALL WE WILL CREATE A BASH FILE IN NANO (LIGHT WEIGHT EDITOR) 

#first command will be
nano process_monitor

# now we will write the code in nano editor

#!/bin/bash

#thresholds (change value as needed)
CPU_THRESHOLD=80
MEM_THRESHOLD=80


#process monitoring script

echo "_____________" >> /var/log/process_monitor.log
echo "process monitoring - $(date)" >> /var/log/process_monitor.log
echo "_____________" >> /var/log/process_monitor.log

# get running processes

ps aux >> /var/log/process_monitor.log

echo "checking for high CPU and memory usage.."

# loop through processes and check CPU and memory usage
# loop through processes and check CPU and memory usage

while read -r user pid cpu mem command; do
    if (( $(echo "$cpu > CPU_THRESHOLD" | bc -l) )); then
        echo "warning: high CPU usage detected - process $command (PID $pid) is using $cpu% CPU"
    fi

    if (( $(echo "$mem > MEM_THRESHOLD" | bc -l) )); then
        echo "warning: high memory usage detected - prcess $command (PID $pid) is using $mem% MEM"
    fi

done < <(ps --no-headers -eo user,pid,%cpu,%mem,comm)

echo "process monitoring completed"


# print on screen too
ps aux


#now save the file (ctrl + o) and exit

#now you will be returned to the terminal 
#before running the file we need to to provide the rights to execute to this file

chmod +x process_monitor.sh #chmod is used to provide the required rights and (+x) is the addition of execution rights.

#now we will run the file 
./process_monitor.sh

# if any error occur regarding the permission then run using the sudo command
sudo ./process_monitor.sh
