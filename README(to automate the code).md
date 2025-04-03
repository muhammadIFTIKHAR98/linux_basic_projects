# AFTER MANUALLY RUNNING THE CODE NOW ITS TIME TO AUTOMATE THE CODE. STEPS BY STEP PROCEDURE WILL BE

1. Save your code and keep in mind the path of your file.
2. Open LINUX TERMINAL (Ctrl + Alt + t).
3. write command  "crontab -e".
4. this will open the nano (lightweight text editor), read the guidelines written carefully.
5. If blank editor open (most probably "Vim") then to get into insert mode click "i", this will enable to write your cron job, after write your job press "esc" to exit the insert mode then write ":wq" and press enter.
6. now, provide the output as per your requirement.
        for example-
                     * * * * * path/to/python/interpreter /path/to/your/saved/python/code
                    5 asterisk will automate the code for timeline of every few minutes
                    As, provided in guidelines in nano text editor provide the numbers or asterisk as per your requirements.
