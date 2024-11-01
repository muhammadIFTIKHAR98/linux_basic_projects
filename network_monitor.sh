#FIRST OF ALL WE WILL CREATE A BASH FILE IN NANO (LIGHT WEIGHT EDITOR) 

#first command will be
nano network_monitor

# now we will write the code in nano editor

#!/bin/bash

#network scanner and monitoring script

#IP range of the local network (update this with your actual network range)
NETWORK="your IP range"

#log file to record network scan results
LOG_FILE="/var/log/network_monitor.log"

#temporary file to store the current scan results
CURRENT_SCAN="/tmp/current_scan.txt"

#temporary file to store the previous scan results
PREVIOUS_SCAN="/tmp/previous_scan.txt"

# step 1: perform network scan using nmapand save the output
echo "[$(date)] starting network scan on $NETWORK" | tee -a "$LOG_FILE"
nmap -sn "$NETWORK" -oG - | awk '/Up$/{print $2}' > "$CURRENT_SCAN"

#step 2: compare the current scan with the previous scan (if it exists)
if [-f "$PREVIOUS_SCAN" ]; then
    NEW_DEVICES=$(comm -13 "$PREVIOUS_SCAN" "$CURRENT_SCAN")
    REMOVED_DEVICES=$(comm -23 "$PREVIOUS_SCAN" "$CURRENT_SCAN")

     #log new devices
     if [ -n "$NEW_DEVICES" ]; then
        echo "[$(date)] new devices detected:" | tee -a "$LOG_FILE"
        echo "$NEW_DEVICES" | tee -a "$LOG_FILE"
     else
        echo "[$(date)] no new devices detected." | tee -a "$LOG_FILE"
     fi
     #log removed devices
     if [ -n "$REMOVED_DEVICES" ]; then
         echo "[$(date)] devices disconnected:" | tee -a "$LOG_FILE"
         echo "$REMOVED_DEVICES" | tee -a "$LOG_FILE"
     else
         echo "[$(date)] no devices removed." | tee -a "$LOG_FILE"
     fi
else
     echo "[$(date)] initial scan completed. no previous scan data found." | tee -a "$LOG_FILE"
fi

#step 3: update the previous scan file for next comparison
mv "$CURRENT_SCAN" "$PREVIOUS_SCAN"
echo "[$(date)] network scan completed." | tee -a "$LOG_FILE"


#now save the file (ctrl + o) and exit

#now you will be returned to the terminal 
#before running the file we need to to provide the rights to execute to this file

chmod +x network_monitor.sh #chmod is used to provide the required rights and (+x) is the addition of execution rights.

#now we will run the file 
./network_monitor.sh

# if any error occur regarding the permission then run using the sudo command
sudo ./network_monitor.sh
