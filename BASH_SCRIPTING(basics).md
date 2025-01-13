#BASIC OF BASH SCRIPTING.

1. Running Bash commands from the command line.
   
      a) when the shell is used interactively, it desplays a "$" when it is waiting for command from the user.
        for ex- user@user:-$ 
          here user@user is the shell prompt.
      b) if the shell is running as the root(a user with administrative rights), the prompt is changed to "#". the super user shell prompt looks like this:
        for ex- [root@host ~]#

2. How to Create and Execute Bash scripts.
   
     a) Script naming convention
         bash scripting ends with ".sh". however bash script can run perfectly fine without the "sh" extension

     b) Adding the SHEBANG
         Bash script starts with a shebang (combination of bash "#" and bang "!") followed by the bash shell path.
         this is the first line of the script.
         Shebang is simply an absolute path to the bash interpreter.
         example - #!/bin/bash

     c) Creating our first bash script
         create a file run_all.sh using the vi command. you can use any editor(vi/vim/Emacs/Gvim/Nano) of your choice.
         now, add the following commands in the file and save it.

     d) Executing the bash script
         To make the script executable, assign execution rights to your user using this command - chmod u+x run_all.sh 
           Here,
              chmod modifies the ownership of a file for the current user :u.
              +x adds the execution rights to the current user. This means that the user who is the owner can now run the script.
              run_all.sh is the file we wish to run.
          you can run the script using any of the mentioned methods:
              sh run_all.sh
              bash run_all.sh
              ./run_all.sh

3. Bash Scripting Commands
         Here is a list of some of the most commonly used bash commands:
            cd: Change the directory to a different location.
            ls: List the contents of the current directory.
            mkdir: Create a new directory.
            touch: Create a new file.
            rm: Remove a file or directory.
            cp: Copy a file or directory.
            mv: Move or rename a file or directory.
            echo: Print text to the terminal.
            cat: Concatenate and print the contents of a file.
            grep: Search for a pattern in a file.
            chmod: Change the permissions of a file or directory.
            sudo: Run a command with administrative privileges.
            df: Display the amount of disk space available.
            history: Show a list of previously executed commands.
            ps: Display information about running processes.

4. Conditional statements (if/else)
         
   
5. Looping and Branching in Bash
   While loop
   For loop
   Case statements
   
6. How to Schedule Scripts using cron
         a) Cron is a powerful utility for job scheduling that is available in Unix-like operating systems.
         b) By configuring Cron, you can setup automated jobs to run on a daily, weekly, monthly, or specific time basis.
         c) the automation capabilities provided by cron play a crucial role in linux system administration.
         d) Cron job example
               * * * * * sh /path/to/script.sh    #Here, the *s represent minute(s) hour(s) day(s) month(s) weekday(s), respectively.
         e) some example are as-
                  Schedule	   Description	                                             Example
                  0 0	      Run a script at midnight every day	                     0 0 /path/to/script.sh
                  /5	         Run a script every 5 minutes	                           /5 /path/to/script.sh
                  0 6 1-5	   Run a script at 6 am from Monday to Friday	            0 6 1-5 /path/to/script.sh
                  0 0 1-7	   Run a script on the first 7 days of every month	         0 0 1-7 /path/to/script.sh
                  0 12 1	   Run a script on the first day of every month at noon	   0 12 1 /path/to/script.sh
         f) Using Crontab
               this Crontab utility is used to add and edit the cron jobs.
               Crontab -l lists the already scheduled scripts for a particular user.
               You can add and edit the cron through crontab -e. 
   
8. How to Debug and Troubleshoot Bash Scripts.
   


     
     
