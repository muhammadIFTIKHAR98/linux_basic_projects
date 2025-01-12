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

3. Bash Scripting basics
    
      
     
     
