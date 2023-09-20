@echo off

title ADMIN TOOL HELP V 1.5

:MAIN MENU
echo.
echo.
echo  === ADMIN TOOL HELP V 1.5 ===
echo.
echo.
echo  MAIN MENU
echo.
echo  CHOOSE THE MENU WHERE YOU NEED HELP... THE MENUS ARE IDENTICAL...
echo.
echo  ACCEPTED: 1=INFOS 2=TOOLS 
echo.
echo.
set /p NUM=TYPE A NUMBER:
echo.

cls

if %NUM%==1 goto INFOS
if %NUM%==2 goto TOOLS
if %NUM% GTR 2 echo (NOT IN USE)
if %NUM% LSS 1 echo (NOT IN USE)

pause
cls
goto MAIN MENU

:INFOS
echo.
echo.
echo  === ADMIN TOOL HELP V 1.5 ===
echo.
echo.
echo  BACK TO THE MAIN MENU: MM
echo.
echo.
echo.
echo  INFOS
echo.
echo  ACCEPTED: 1=SYSTEMINFO 2=USERINF 3=USERINFO (SPECIFIED ACCOUNT) 4=TASKLIST 5=DRIVERQUERY
echo.
echo  6=MENU (DRIVES / FOLDERS / FILES) 7=IP CONFIG 8=NETSTAT 9=PING 10=TRACERT 11=POWERCFG
echo.
echo.
set /p TASK=TASK:

cls

if %TASK%==1 goto SYSINFO
if %TASK%==2 goto USERINF
if %TASK%==3 goto USERINFO_ACC
if %TASK%==4 goto TASKLIST
if %TASK%==5 goto DQ
if %TASK%==6 goto FILES
if %TASK%==7 goto IP CONFIG
if %TASK%==8 goto NETSTAT
if %TASK%==9 goto PING
if %TASK%==10 goto TRACERT
if %TASK%==11 goto POWERCFG

if %TASK%==MM goto MAIN MENU

if %TASK% GTR 11 echo  (NOT IN USE)
if %TASK% LSS 1 echo  (NOT IN USE)

pause
cls
goto MAIN MENU

:SYSINFO
echo.
echo  SYSTEMINFO
echo.
echo  HERE YOU WILL FIND ALL THE INFOS ABOUT THIS PC
echo.

pause
cls
goto MAIN MENU

:USERINF
echo.
echo  USERINFO
echo.
echo  ALL THE REGISTERED USERS OF THIS PC WILL BE DISPLAYED HERE
echo.

pause
cls
goto MAIN MENU

:USERINFO_ACC
echo.
echo  USERINFO (SPECIFIED ACCOUNT)
echo.
echo  ALL INFOS ABOUT THE SPECIFIED ACCOUNT WILL BE DISPLAYED HERE
echo.

pause
cls
goto MAIN MENU

:IP CONFIG
echo.
echo  IP CONFIG
echo.
echo  ALL INFOS ABOUT THE NETWORK CONNECTION OF THE PC WILL BE DISPLAYED HERE
echo.

pause
cls
goto MAIN MENU

:TASKLIST
echo.
echo  TASKLIST
echo.
echo  A LIST OF ALL PROCESSES (BACKGROUND PROCESSES INCLUDED)
echo.

pause
cls
goto MAIN MENU

:DQ
echo.
echo DRIVER QUERRY
echo.
echo  A LIST OF ALL INSTALLED DRIVERS
echo.

pause
cls
goto MAIN MENU

:NETSTAT
echo.
echo  NETSTAT
echo.
echo  DISPLAYS ALL OPEN NETWORK CONNECTIONS AND LISTENING PORTS
echo.

pause
cls
goto main menu

:FILES
echo.
echo.
echo  === ADMIN TOOL HELP V 1.5 ===
echo.
echo.
echo PREVIOUS MENU: BACK
echo.
echo.
echo.
echo  DRIVES / FOLDERS /  FILES
echo.
echo  1=TREE 2=CHECK DRIVE 3=DRIVE/FOLDER INFO
echo.
echo.
set /p INPUT=TASK:

cls

if %INPUT%==1 goto TREE
if %INPUT%==2 goto CHKDSK
if %INPUT%==3 goto DIR

if %INPUT%==BACK goto INFOS

if %INPUT% GTR 3 echo  (NOT IN USE)
if %INPUT% LSS 1 echo  (NOT IN USE)

pause
cls
goto MAIN MENU

:TREE
echo.
echo  TREE
echo.
echo  WARNING: VERY LARGE DIRECTORIES AREN'T DISPLAYED COMPLETELY AND THE DURATION OF THE COMMAND CAN BE VERY LONG
echo.
echo  ALL FOLDERS, SUBFOLDERS AND FILES OF THE SPECIFIED DRIVE WILL BE DISPLAYED GRAPHICALLY HERE
echo.
echo.
echo  E.G. TARGET (DRIVE):C:     OR     TARGET (FOLDER):C:\Users
echo.

pause
cls

help
tree

pause
cls
goto MAIN MENU

:CHKDSK
echo.
echo  CHECK DRIVE
echo.
echo  ALL INFOS ABOUT THE SPECIFIED DRIVE WILL BE DISPLAYED HERE
echo.
echo  E.G. TARGET:C:
echo.

pause
cls

help chkdsk

pause
cls
goto MAIN MENU

:DIR
echo.
echo  DIR
echo.
echo  ALL FOLDERS AND FILES OF THE SPECIFIED DRIVE WILL BE DISPLAYED HERE
echo.
echo  E.G. TARGET (DRIVE):C:\     OR     TARGET (FOLDER):C:\USERS
echo.

pause
cls

help dir

pause
cls
goto MAIN MENU

:PING
echo.
echo  PING
echo.
echo  SENDS TEST PACKETS OVER THE NETWORK TO WHICH YOUR PC IS CONNECTED TO DETERMINE THE STRENGTH OF THE CONNECTION
echo.
echo  E.G. TARGET (DEVICE):Fritz.box     OR     TARGET (WEBSITE):Google.com   ALSO ACCEPTS IP ADRESSES
echo.

pause
cls
goto MAIN MENU

:TRACERT
echo.
echo  TRACERT
echo.
echo  DISPLAYS THE ROUTE OF YOUR INTERNET TRAFFIC FROM YOUR BROWSER TO THE TARGET SYSTEM E.G. GOOGLE SERVERS
echo.
echo  E.G. TARGET (DEVICE):Fritz.box     OR     TARGET (WEBSITE):Google.com   ALSO ACCEPTS IP ADRESSES
echo.

pause
cls
goto MAIN MENU

:POWERCFG
echo.
echo.
echo  === ADMIN TOOL V 1.5 ===
echo.
echo.
echo  PREVIOUS MENU: BACK
echo.
echo.
echo.
echo  POWERCFG
echo.
echo.
echo  ACCEPTED: 1=ENERGY USAGE (FOR PC USERS) 2=BATTERY USAGE (FOR LAPTOP USERS)
echo.
echo.
set /p CHOOSE_PCFG=TASK:

cls

if %CHOOSE_PCFG%==1 goto ENERGY_USAGE
if %CHOOSE_PCFG%==2 goto BATTERY_USAGE

if %CHOOSE_PCFG%==BACK goto INFOS

if %CHOOSE_PCFG% GTR 2 echo  (NOT IN USE)
if %CHOOSE_PCFG% LSS 1 echo  (NOT IN USE)

pause
cls
goto MAIN MENU

:ENERGY_USAGE
echo.
echo  ENERGY USAGE
echo.
echo.
echo  ADMINISTRATOR PERMISSIONS ARE REQUIRED FOR THIS COMMAND
echo.
echo  CREATES AN DISAGNOSE FILE WITH ALL INFORMATIONS OF THE COMPUTERS ENERGY USAGE
echo.
echo.
echo  THE DEAFAULT LOCATION OF THE FILE IS C:\Windows\System32
echo.
echo.
echo.
echo  AFTER THE 60 SECONDS, THE PROGRAM WILL ASK YOU, IF YOU WANT TO OPEN THE FILE...
echo.

pause
cls
goto MAIN MENU

:BATTERY_USAGE
echo.
echo  BATTERY_USAGE
echo.
echo.
echo  ADMINISTRATOR PERMISSIONS ARE REQUIRED FOR THIS COMMAND
echo.
echo  CREATES AN DISAGNOSE FILE WITH ALL INFORMATIONS OF THE LAPTOPS BATTERY USAGE
echo.
echo.
echo  THE DEAFAULT LOCATION OF THE FILE IS C:\Windows\System32
echo.
echo.
echo.
echo  AFTER THE 60 SECONDS, THE PROGRAM WILL ASK YOU, IF YOU WANT TO OPEN THE FILE...
echo.

pause
cls
goto MAIN MENU

:TOOLS (MENU)
echo.
echo.
echo  === ADMIN TOOL HELP V 1.5 ===
echo.
echo.
echo  BACK TO THE MAIN MENU: MM
echo.
echo.
echo.
echo  TOOLS
echo.
echo  ACCEPTED: 1=SHUTDOWN 2=RESTART 3=LOGOUT 4=CHANGE LOGIN PASSWORD 5=MENU (TASKS / PROGRAMS) 
echo.
echo  6=MENU (DRIVES / FOLDERS / FILES) 7=SCANNOW 8=MENU (DATE / TIME) 
echo.
set /p EINGABE=TASK:

cls

if %EINGABE%==1 goto SHUTDOWN
if %EINGABE%==2 goto RESTART
if %EINGABE%==3 goto LOGOUT
if %EINGABE%==4 goto PWC
if %EINGABE%==5 goto TASKS
if %EINGABE%==6 goto FILES_T
if %EINGABE%==7 goto SCANNOW
if %EINGABE%==8 goto D_T

if %EINGABE%==MM goto MAIN MENU

if %EINGABE% GTR 8 echo  (NOT IN USE)
if %EINGABE% LSS 1 echo  (NOT IN USE)

pause
cls
goto MAIN MENU

:SHUTDOWN
echo.
echo  SHUTDOWN
echo.
echo  HERE YOU CAN SHUT DOWN THIS PC DIRECTLY, IN 30 SECONDS OR IN A SELF DEFINED TIME
echo.

pause
cls

help shutdown

pause
cls
goto MAIN MENU

:RESTART
echo.
echo  RESTART
echo.
echo  HERE YOU CAN RESTART THIS PC DIRECTLY, IN 30 SECONDS OR IN A SELF DEFINED TIME
echo.

pause
cls

help shutdown

pause
cls
goto MAIN MENU

:LOGOUT
echo.
echo  LOGOUT
echo.
echo  YOU WILL BE AUTOMATICALLY LOGGED OUT AND SENT TO THE LOCK SCREEN
echo.

pause
cls
goto MAIN MENU

:PWC
echo.
echo  PASSWORD CHANGE
echo.
echo  HERE YOU CAN CHANGE THE LOGIN PASSWORD OF THE USERS OF THE PC
echo.

pause
cls
goto MAIN MENU

:TASKS
echo.
echo.
echo  === ADMIN TOOL HELP V 1.5 ===
echo.
echo.
echo  PREVIOUS MENU: BACK
echo.
echo.
echo.
echo  TASKS / PROGRAMS
echo.
echo  ACCEPTED: 1=START 2=TASKKILL
echo.
echo.
set /p CHOICE=TASK:

cls

if %CHOICE%==1 goto START_TASK
if %CHOICE%==2 goto TK

if %CHOICE%==BACK goto TOOLS (MENU)

if %CHOICE% GTR 2 echo  (NOT IN USE)
if %CHOICE% LSS 1 echo  (NOT IN USE)

pause
cls
goto MAIN MENU

:START_TASK
echo.
echo  START
echo.
echo  STARTS AN TASK (PROGRAM)
echo.
echo  HERE YOU CAN START TASKS AND PROGRAMS
echo.
echo  THERE ARE 2 OPTIONS:
echo.
echo  1. ENTER THE TASKS / PROGRAMS NAME E.G. Discord.exe
echo.
echo  2. ENTER THE TASKS / PROGRAMS LOCATION E.G: C:\Windows\explorer.exe
echo.
echo.
echo.
echo  (SOME PROGRAMS HAVE SPECIAL NAMES...) E.G. THE TASKNAME OF WORD ISN'T WORD.exe ITS WINWORD.exe
echo.
echo  YOU CAN GET THE CORRECT NAME OF AN PROCESS BY OPENING TASK MANAGER AND GOING TO DETAILS
echo.
echo  ALSO YOU CAN RIGHT CLICK AN PROGRAM AND THEN NAVIGATE TO PROPERTIES OR PROPERTIES DETAILS
echo.

pause
cls
goto MAIN MENU

:TK
echo.
echo  TASKKILL
echo.
echo  ENDS THE ENTERED PROCESS
echo.
echo  WARNING: QUITTING (KILLING) SYSTEM PROCESSES CAN CAUSE THE PC TO CRASH!!!
echo.
echo  E.G. PROCESS NAME:Discord.exe
echo.
echo.
echo.
echo  (SOME PROGRAMS HAVE SPECIAL NAMES...) E.G. THE TASKNAME OF WORD ISN'T WORD.exe ITS WINWORD.exe
echo.
echo  YOU CAN GET THE CORRECT NAME OF AN PROCESS BY OPENING TASK MANAGER AND GOING TO DETAILS
echo.

pause
cls
goto MAIN MENU

:FILES_T
echo.
echo.
echo  === ADMIN TOOL HELP V 1.5 ===
echo.
echo.
echo  PREVIOUS MENU: BACK
echo.
echo.
echo.
echo  FOLDERS/FILES
echo.
echo  1=ERASE 2=RMDIR 3=FORMAT 4=MOVE 5=MD 6=ENCRYPT / DECRYPT
echo.
echo.
set /p NUMBER=TASK:

cls

if %NUMBER%==1 goto ERASE
if %NUMBER%==2 goto RMDIR
if %NUMBER%==3 goto FORMAT
if %NUMBER%==4 goto MOVE
if %NUMBER%==5 goto MD
if %NUMBER%==6 goto EN_DECRYPTION

if %NUMBER%==BACK goto TOOLS

if %NUMBER% GTR 6 echo  (NOT IN USE)
if %NUMBER% LSS 1 echo  (NOT IN USE)

pause
cls
goto MAIN MENU

:ERASE
echo.
echo  ERASE
echo.
echo  DELETES THE SPECIFIED FOLDERS AND FILES
echo.
echo  E.G. TARGET(S):C:\Windows\Temp
echo.

pause
cls

help
erase

pause
cls
goto MAIN MENU

:RMDIR
echo.
echo  RMDIR
echo.
echo  REMOVES (DELETES) FOLDERS
echo.
echo  VERY USEFUL IN THE C:\WINDOWS FOLDER, BECAUSE YOU CAN'T DELETE FOLDERS THERE VIA CMD (ONLY THE CONTENTS)
echo.

pause
cls
goto MAIN MENU

:MOVE
echo.
echo  MOVE
echo.
echo  MOVES FILES FROM A TO B
echo.
echo  E.G. TARGET(S):C\Windows\Temp\Hi.txt
echo.
echo       TARGET LOCATION:C:\
echo.

pause
cls

help move

pause
cls
goto MAIN MENU

:FORMAT
echo.
echo  FORMAT
echo.
echo  COMPLETELY DELETES EVERY FOLDER/FILE ON THE SPECIFIED DRIVE!
echo.
echo  WARNING: ALL FILES / FOLDERS THIS DISK CONTAINS WILL BE COMPLETLY ERASED! THIS DATA CAN'T BE RESTORED ANYMORE!
echo.
echo  E.G. TARGET (DRIVE):F:
echo.

pause
cls

help format

pause
cls
goto MAIN MENU

:MD
echo.
echo  MD
echo.
echo  CREATES AN FOLDER ON THE SPECIFIED DRIVE OR IN A FOLDER ON A SPECIFIED DRIVE
echo.

pause
cls

help md

pause
cls
goto MAIN MENU

:EN_DECRYPTION
echo.
echo  EN / DECRYPTION
echo.
echo  MAKES FILES / FOLDERS INVISIBLE AND INSCCESSABLE BY ADDING ATTRIBUTES
echo.
echo  OR REMOVES THESE ATTRIBUTES TO BRING THEM BACK TO NORMAL
echo.

pause
cls
goto MAIN MENU

:SCANNOW
echo.
echo  SCANNOW
echo.
echo  ADMINISTRATOR PERMISSIONS ARE REQUIRED FOR THIS COMMAND
echo.
echo  THIS COMMAND IS AN AUTOMATIC PC REPAIR PROGRAM THAT CAN DETECT DAMAGED OR DELETED SYSTEM FILES
echo.
echo  IF DAMAGED OR DELETED SYSTEM FILES ARE FOUND, THE PROGRAM WILL REPLACE THEM
echo.

pause
cls
goto MAIN MENU

:D_T
echo.
echo  DATE / TIME
echo.
echo  WITH DATE YOU CAN CHANGE THE DATE
echo.
echo  WITH TIME YOU CAN CHANGE THE TIME
echo.

pause
cls
goto MAIN MENU