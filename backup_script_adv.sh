#FIRST OF ALL WE WILL CREATE A BASH FILE IN NANO (LIGHT WEIGHT EDITOR) 

#first command will be
nano backup_script_adv

# now we will write the code in nano editor

#!/bin/bash (this is known as the shebang, it is to tell the linux that this script will run from Bourne Again SHell (BASH))

#Automated backup and restore script

#directories to backup
BACKUP_DIRS="/home/muhammad-iftikhar/sample_directory"

#backup destinations (remote server)
REMOTE_USER="remote_user"
REMOTE_HOST="remote_server_ip"
REMOTE_PATH="/remote/backup/directory"

#local temporary backup storage
BACKUP_NAME="backup_$(date +'%Y-%m-%d_%H-%M-%S').tar.gz"
BACKUP_PATH="/tmp/$BACKUP_NAME"

#encryption key for GPG
GPG_KEY="backup_script_adv"   #your_gpg_key

#log file for backup operations
LOG_FILE="/var/log/backup.log"


#step-1 create a compressed archive of the specified directories
echo "[$(date)] starting backup..." | tee -a "$LOG_FILE"
tar -czf "$BACKUP_PATH" $BACKUP_DIRS
if [ $? -ne 0 ]; then
    echo "[$(date)] error: failed to create archive." | tee -a "$LOG_FILE"
    exit 1
fi

# step 2: encrypt the backup file using GPG
echo "[$(date)] encrypting the backup file..." | tee -a "$LOG_FILE"
gpg --output "$BACKUP_PATH.gpg" --encrypt --recipient "$GPG_KEY" "$BACKUP_PATH"
if [ $? -ne 0 ]; then
    echo "[$(date)] error: failed to encrypt backup." | tee -a "$LOG_FILE"
    exit 1
fi

#step-3: transfer the encrypted backup to the remote server using SCP
echo "[$(date)] transferring backup to remote server..." | tee -a "$LOG_FILE"
scp "$BACKUP_PATH.gpg" "$REMOTE_USER@$REMOTE_HOST:$REMOTE_PATH"
if [ $? -ne 0 ]; then
    echo "[$(date)] error: failed to transfer backup to remote server." | tee -a "$LOG_FILE"
    exit 1
fi

#step-4: clean up local temporary files
rm -f "$BACKUP_PATH" "$BACKUP_PATH.gpg"

echo "[$(date)] backup completed successfully." | tee -a "$LOG_FILE"

#now save the file (ctrl + o) and exit

#now you will be returned to the terminal 
#before running the file we need to to provide the rights to execute to this file

chmod +x backup_script_adv.sh #chmod is used to provide the required rights and (+x) is the addition of execution rights.

#now we will run the file 
./backup_script_adv.sh

# if any error occur regarding the permission then run using the sudo command
sudo ./backup_script_adv.sh
