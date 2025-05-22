#FIRST OF ALL WE WILL CREATE A BASH FILE IN NANO (LIGHT WEIGHT EDITOR) 

#first command will be
nano backup_script

# now we will write the code in nano editor

#!/bin/bash  (this is known as the shebang, it is to tell the linux that this script will run from Bourne Again SHell (BASH))

#backup script

#set the date format for the backup filename
DATE=$(date +%Y-%m-%d)
    
#define directories to back up (separate with spaces if multiple)
SOURCE_DIRS="/home/muhammad-iftikhar/sample_dir /var/www/html"

#define backup destination directory
BACKUP_DIR="/home/muhammad-iftikhar/fbackup_dir"

#define backup file name
BACKUP_FILE="$BACKUP_DIR/backup_$DATE.tar.gz"

#create a backup directory if it doesn't exist
if [ ! -d "$BACKUP_DIR" ]; then
    mkdir -p "$BACKUP_DIR"
fi

# archive and compress the directories
echo "starting backup of $SOURCE_DIRS to $BACKUP_FILE"
tar -czf "$BACKUP_FILE" $SOURCE_DIRS

#check if the backup was successful
if [ $? -eq 0 ]; then
    echo "backup completed successfully!"
else
    echo "backup failed!"
fi

#optional: delete backup older than 7 days
find "$BACKUP_DIR" -type f -name "*.tar.gz" -mtime +7 -exec rm {} \;

echo "old backups deleted if any existed (older than 7 days)."

#now save the file (ctrl + o) and exit

#now you will be returned to the terminal 
#before running the file we need to to provide the rights to execute to this file

chmod +x backup_script.sh #chmod is used to provide the required rights and (+x) is the addition of execution rights.

#now we will run the file 
./backup_script.sh

# if any error occur regarding the permission then run using the sudo command
sudo ./backup_script.sh
