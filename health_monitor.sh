#FIRST OF ALL WE WILL CREATE A BASH FILE IN NANO (LIGHT WEIGHT EDITOR) 

#first command will be
nano health_monitor

# now we will write the code in nano editor

#!/bin/bash

# System and Network Health Monitoring Script

# Set thresholds
CPU_THRESHOLD=85
MEMORY_THRESHOLD=90
DISK_THRESHOLD=80
LATENCY_THRESHOLD=100  # milliseconds

# Email for notifications
EMAIL="your_email@example.com"

# Log file
LOG_FILE="/var/log/health_monitor.log"

# Step 1: Check CPU usage
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')
if (( ${CPU_USAGE%.*} > CPU_THRESHOLD )); then
    echo "[$(date)] CPU usage is high: ${CPU_USAGE}%." | tee -a "$LOG_FILE"
    echo "Warning: CPU usage has exceeded $CPU_THRESHOLD%. Current usage: ${CPU_USAGE}%." | mail -s "CPU Usage Alert" "$EMAIL"
fi

# Step 2: Check Memory usage
MEMORY_USAGE=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
if (( ${MEMORY_USAGE%.*} > MEMORY_THRESHOLD )); then
    echo "[$(date)] Memory usage is high: ${MEMORY_USAGE}%." | tee -a "$LOG_FILE"
    echo "Warning: Memory usage has exceeded $MEMORY_THRESHOLD%. Current usage: ${MEMORY_USAGE}%." | mail -s "Memory Usage Alert" "$EMAIL"
fi

# Step 3: Check Disk usage for the root partition
DISK_USAGE=$(df / | grep '/' | awk '{print $5}' | tr -d '%')
if (( DISK_USAGE > DISK_THRESHOLD )); then
    echo "[$(date)] Disk usage is high: ${DISK_USAGE}%." | tee -a "$LOG_FILE"
    echo "Warning: Disk usage has exceeded $DISK_THRESHOLD%. Current usage: ${DISK_USAGE}%." | mail -s "Disk Usage Alert" "$EMAIL"
fi

# Step 4: Check network connectivity
if ! ping -c 1 8.8.8.8 &> /dev/null; then
    echo "[$(date)] Network connectivity issue detected." | tee -a "$LOG_FILE"
    echo "Warning: Unable to reach external network (Google DNS 8.8.8.8)." | mail -s "Network Connectivity Alert" "$EMAIL"
else
    # Step 5: Check latency
    LATENCY=$(ping -c 1 8.8.8.8 | grep 'time=' | awk -F'time=' '{print $2}' | awk '{print $1}')
    if (( ${LATENCY%.*} > LATENCY_THRESHOLD )); then
        echo "[$(date)] High latency detected: ${LATENCY} ms." | tee -a "$LOG_FILE"
        echo "Warning: Network latency has exceeded ${LATENCY_THRESHOLD} ms. Current latency: ${LATENCY} ms." | mail -s "Network Latency Alert" "$EMAIL"
    fi
fi

# Log that all checks completed successfully
echo "[$(date)] Health check completed." >> "$LOG_FILE"


#now save the file (ctrl + o) and exit

#now you will be returned to the terminal 
#before running the file we need to to provide the rights to execute to this file

chmod +x backup_script.sh #chmod is used to provide the required rights and (+x) is the addition of execution rights.

#now we will run the file 
./backup_script.sh

# if any error occur regarding the permission then run using the sudo command
sudo ./backup_script.sh
