FIRST OF ALL WE WILL CREATE A BASH FILE IN NANO (LIGHT WEIGHT EDITOR) 

#first command will be
nano log_analysis

# now we will write the code in nano editor

#!/bin/bash

#log file analysis script

#log files to analyze
AUTH_LOG="/var/log/auth.log"
SYS_LOG="/var/log/syslog"

#output report file
REPORT_FILE="/var/log/log_analysis_report.log"

#get current date and time for report
DATE=$(date +'%Y-%m-%d %H:%M:%S')

#start the script
echo "log analysis repport - $DATE" > "$REPORT_FILE"
echo "__________________________________________" >> "$REPORT_FILE"

#analyze authentication log (failed SSH logins)
echo "failed SSH login attempts:" >> "$REPORT_FILE"
grep "failed password" "$AUTH_LOG" | awk '{print $1, $2, $3,$9, $11}' >> "$REPORT_FILE"
echo "_________________________________________" >> "$REPORT_FILE"


#analyze system log (error and warnings)
echo "system errors and warnings from syslog:" >> "$REPORT_FILE"
grep -i "error\|warning" "$SYS_LOG" >> "$REPORT_FILE"
echo "_________________________________________" >> "$REPORT_FILE"

#completion message
echo "log analysis completed. report saved to $REPORT_FILE"


#now save the file (ctrl + o) and exit

#now you will be returned to the terminal 
#before running the file we need to to provide the rights to execute to this file

chmod +x log_analysis.sh #chmod is used to provide the required rights and (+x) is the addition of execution rights.

#now we will run the file 
./log_analysis.sh

# if any error occur regarding the permission then run using the sudo command
sudo ./log_analysis.sh
