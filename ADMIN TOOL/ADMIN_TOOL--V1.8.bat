@echo off

title ADMIN TOOL V 1.8

:BatchGotAdmin
REM  --> Check for permissions
    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params= %*
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"

:START
echo set WshShell = WScript.CreateObject("WScript.Shell") > %tmp%\Foldernotfound.vbs
echo WScript.Quit (WshShell.Popup( "Application's Appdata Folder not found!" ,10 ,"ERROR 404", vbCritical + 0)) >> %tmp%\Foldernotfound.vbs
if not exist "C:\Windows\Z" (
cscript /nologo %tmp%\Foldernotfound.vbs
if %errorlevel%==1 (
  del %tmp%\Foldernotfound.vbs
) else (
  del %tmp%\Foldernotfound.vbs
)
del %tmp%\Foldernotfound.vbs
cls
echo.
echo  BEFORE YOU CAN USE THIS APP FOR THE FIRST TIME, YOU HAVE TO RUN THE SETUP!
echo.                                                                                                    
pause
exit)
goto :CHECK_01

:CHECK_01
echo set WshShell = WScript.CreateObject("WScript.Shell") > %tmp%\Filenotfound01.vbs
echo WScript.Quit (WshShell.Popup( "File not found! [ PWHASH.dll ]" ,10 ,"ERROR 404", vbCritical + 0)) >> %tmp%\Filenotfound01.vbs
if not exist "C:\Windows\Z\PWHASH.dll" (
cscript /nologo %tmp%\Filenotfound01.vbs
if %errorlevel%==1 (
  del %tmp%\Filenotfound01.vbs
) else (
  del %tmp%\Filenotfound01.vbs
)
del %tmp%\Filenotfound01.vbs
cls
echo.
echo  !!!ERROR!!! {REQUIRED FILE NOT FOUND} PLEASE RUN THE SETUP!
echo.
pause
exit)
goto CHECK_02

:CHECK_02
echo set WshShell = WScript.CreateObject("WScript.Shell") > %tmp%\Filenotfound02.vbs
echo WScript.Quit (WshShell.Popup( "File not found! [ VKHASH.dll ]" ,10 ,"ERROR 404", vbCritical + 0)) >> %tmp%\Filenotfound02.vbs
if not exist "C:\Windows\Z\VKHASH.dll" (
cscript /nologo %tmp%\Filenotfound02.vbs
if %errorlevel%==1 (
  del %tmp%\Filenotfound02.vbs
) else (
  del %tmp%\Filenotfound02.vbs
)
del %tmp%\Filenotfound02.vbs
cls
echo.
echo  !!!ERROR!!! {REQUIRED FILE NOT FOUND} PLEASE RUN THE SETUP!
echo.
pause
exit)

:PW
echo.
echo.
echo  === ADMIN TOOL V 1.8 ===
echo.
echo.
echo  THIS IS THE ADMIN TOOL PROGRAM. A POWERFUL TOOL FOR YOUR PC
echo.
echo  PLEASE BE CAREFUL AND DONT USE THIS PROGRAM FOR EVIL PURPUSES
echo.
echo.
echo.
echo  PLEASE ENTER YOUR PASSWORD...
echo.
set /p PASSWORD=PASSWORD:
cls
echo %PASSWORD% > C:\Windows\Z\TEMP.txt
pause
goto CHECK

:CHECK
certutil -hashfile C:\Windows\Z\TEMP.txt SHA256 >> C:\Windows\Z\HASH.txt
cls
for /f "tokens=1,* delims=:" %%i in ('findstr /n  $ C:\Windows\Z\HASH.txt') do @(
        for /L %%a in (2,1,2) do @if %%i==%%a @echo %%j >> C:\Windows\Z\LOGIN.txt
)
del C:\Windows\Z\TEMP.txt
del C:\Windows\Z\HASH.txt
cls
for /f "delims=" %%a in (C:\Windows\Z\PWHASH.dll) do (set USER INP.1=%%a)
for /f "delims=" %%a in (C:\Windows\Z\LOGIN.txt) do (set USER INP.2=%%a)
if %USER INP.1%==%USER INP.2% (del C:\Windows\Z\LOGIN.txt
cls
pause
goto MAIN MENU
)

del C:\Windows\Z\LOGIN.txt
cls
echo.
echo  PASSWORD INCORRECT! TRY AGAIN!
echo.

pause
cls
goto PW

:MAIN MENU
cls
echo.
echo.
echo  === ADMIN TOOL V 1.8 ===
echo.
echo.
echo  IF YOU NEED HELP... OPEN THE PROGRAM ADMIN_TOOL_HELP! THERE YOU CAN LOOK FOR ANY COMMAND TO SEE ITS DESCRIPTION
echo.
echo.
echo  MAIN MENU
echo.
echo  ACCEPTED: 1=INFO SECTION 2=TOOL SECTION 3=COLOR SETTINGS
echo.
echo.
set /p NUM=TYPE A NUMBER:
echo.

cls

if %NUM%==1 goto INFOS
if %NUM%==2 goto VERIFICATION
if %NUM%==3 goto COLOR SETTINGS

if %NUM% GTR 3 (echo.
echo  NOT IN USE
echo.)

if %NUM% LSS 1 (echo.
echo  NOT IN USE
echo.)

pause
cls
goto MAIN MENU

:COLOR SETTINGS
echo.
echo.
echo  === ADMIN TOOL V 1.8 ===
echo.
echo.
echo  COLOR SETTINGS
echo.
echo  ACCEPTED: 1=DEFAULT 2=LIME 3=LIGHT RED 4=AQUA 5=GREEN 6=RED 7=BLUE
echo.
echo.
set /p COLOR=COLOR (NUM):
cls

if %COLOR%==1 (color 07
echo.
echo  The Color has been changed successfully!
echo.)
if %COLOR%==2 (color 0A
echo.
echo  The Color has been changed successfully!
echo.)
if %COLOR%==3 (color 0C
echo.
echo  The Color has been changed successfully!
echo.)
if %COLOR%==4 (color 03
echo.
echo  The Color has been changed successfully!
echo.)
if %COLOR%==5 (color 02
echo.
echo  The Color has been changed successfully!
echo.)
if %COLOR%==6 (color 04
echo.
echo  The Color has been changed successfully!
echo.)
if %COLOR%==7 (color 01
echo.
echo  The Color has been changed successfully!
echo.)

if %COLOR% GTR 7 (echo.
echo  NOT IN USE
echo.)

if %COLOR% LSS 1 (echo. 
echo  NOT IN USE
echo.)

pause
cls
goto COLOR SETTINGS

:INFOS
echo.
echo.
echo  === ADMIN TOOL V 1.8 ===
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

if %TASK%==1 (systeminfo
echo.)
if %TASK%==2 (net user
echo.)
if %TASK%==3 goto USERINFO_ACC
if %TASK%==4 (tasklist
echo.)
if %TASK%==5 (driverquery
echo.)
if %TASK%==6 goto FILES
if %TASK%==7 (ipconfig /all
echo.)
if %TASK%==8 (netstat -an
echo.)
if %TASK%==9 goto PING
if %TASK%==10 goto TRACERT
if %TASK%==11 goto POWERCFG

if %TASK%==MM goto MAIN MENU

if %TASK% GTR 11 (echo.  
echo  NOT IN USE
echo.)

if %TASK% LSS 1 (echo.  
echo  NOT IN USE
echo.)

pause
cls
goto MAIN MENU

:USERINFO_ACC
echo.
echo  USERINFO (SPECIFIED ACCOUNT)
echo.
echo.
set /p ACC=ACCOUNT NAME:

cls

net user %ACC%
echo.

pause
cls
goto MAIN MENU

:FILES
echo.
echo.
echo  === ADMIN TOOL V 1.8 ===
echo.
echo.
echo  PREVIOUS MENU: BACK
echo.
echo.
echo.
echo  DRIVES / FOLDERS / FILES
echo.
echo  ACCEPTED: 1=TREE 2=CHECK DRIVE 3=DRIVE/FOLDER INFO
echo.
echo.
set /p INPUT=TASK:

cls

if %INPUT%==1 goto TREE
if %INPUT%==2 goto CHKDSK
if %INPUT%==3 goto DIR

if %INPUT%==BACK goto INFOS

if %INPUT% GTR 3 (echo.  
echo  NOT IN USE
echo.)

if %INPUT% LSS 1 (echo.  
echo  NOT IN USE
echo.)

pause
cls
goto MAIN MENU

:TREE
echo.
echo  TREE
echo.
echo.
echo  DISPLAYS ALL FOLDERS, SUBFOLDERS AND FILES OF THE SPECIFIED DRIVE
echo.
echo.
echo  WARNING: VERY LARGE DIRECTORIES CAN'T BE DISPLAYED COMPLETELY AND THE DURATION OF THE COMMAND CAN BE VERY LONG
echo.
echo.
set /p C=TARGET (DRIVE/FOLDER):

cls

Tree %C%
echo.

pause
cls
goto MAIN MENU

:CHKDSK
echo.
echo  CHECK DRIVE
echo.
echo  FOR HARD DRIVES THAT CONTAIN SYSTEM FILES (LIKE C:), THE PROGRAM HAS TO BE RUN AS ADMINISTRATOR
echo.
echo.
set /p D=TARGET:

cls

chkdsk %D%
echo.

pause
cls
goto MAIN MENU

:DIR
echo.
echo  DIR
echo.
echo.
echo  SHOWS ALL FOLDERS AND FILES OF THE SPECIFIED DRIVE OR FOLDER
echo.
echo.
set /p E=TARGET (DRIVE/FOLDER):

cls

dir %E%
echo.

pause
cls
goto MAIN MENU

:PING
echo.
echo  PING
echo.
echo.
echo  SENDS TEST PACKETS OVER THE NETWORK TO WHICH YOUR PC IS CONNECTED TO DETERMINE THE STRENGTH OF THE CONNECTION
echo.
echo  TEST INFO: ATTEMPTS 10 | SIZE 100 BYTES
echo.
echo.
set /p PTARGET=TARGET (DEVICE OR WEBSITE):

cls

ping -n 10 -l 100 %PTARGET%

pause
cls
goto MAIN MENU

:TRACERT
echo.
echo  TRACERT
echo.
echo.
echo  DISPLAYS THE ROUTE OF YOUR INTERNET TRAFFIC FROM YOUR BROWSER TO THE TARGET SYSTEM E.G. GOOGLE SERVERS
echo.
echo.
set /p DEV_WEB=(DEVICE OR WEBSITE):

cls

tracert %DEV_WEB%

pause
cls
goto MAIN MENU

:POWERCFG
echo.
echo.
echo  === ADMIN TOOL V 1.8 ===
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

if %CHOOSE_PCFG% GTR 2 (echo.  
echo  NOT IN USE
echo.)

if %CHOOSE_PCFG% LSS 1 (echo.  
echo  NOT IN USE
echo.)

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
echo  AFTER THE PROCESS IS FINISHED, YOU WILL BE AKSED IF YOU WANT TO OPEN THE REPORT FILE
echo.
echo.

powercfg -energy

pause
cls
goto REPORT_EU

:REPORT_EU
echo.
echo  ENERGY USAGE (REPORT)
echo.
echo.
echo  THE COMMAND CREATED AN FILE WITH DETAILED INFORMATIONS...
echo.
echo.
set /p REPORT=OPEN FILE? (Y/N):
cls

if %REPORT%==Y start %windir%\explorer.exe "C:\Windows\System32\energy-report.html"
if %REPORT%==N goto MAIN MENU

cls
goto MAIN MENU

:BATTERY_USAGE
echo.
echo  BATTERY USAGE
echo.
echo.
echo  ADMINISTRATOR PERMISSIONS ARE REQUIRED FOR THIS COMMAND
echo.
echo  CREATES AN DISAGNOSE FILE WITH ALL INFORMATIONS OF THE COMPUTERS BATTERY USAGE
echo.
echo  AFTER THE PROCESS IS FINISHED, YOU WILL BE AKSED IF YOU WANT TO OPEN THE REPORT FILE
echo.
echo.

powercfg -batteryreport

pause
cls
goto REPORT_BU

:REPORT_BU
echo.
echo  BATTERY USAGE (REPORT)
echo.
echo.
echo  THE COMMAND CREATED AN FILE WITH DETAILED INFORMATIONS...
echo.
echo.
set /p REPORT=OPEN FILE? (Y/N):
cls

if %REPORT%==Y start %windir%\explorer.exe "C:\Windows\System32\battery-report.html"
if %REPORT%==N goto MAIN MENU

cls
goto MAIN MENU

:VERIFICATION
echo.
echo.
echo  === ADMIN TOOL V 1.8 ===
echo.
echo.
echo  PLEASE ENTER YOUR VERIFICATION KEY...
echo.
set /P VERIFICATION_KEY=VERIFICATION KEY:
cls
echo %VERIFICATION_KEY% > C:\Windows\Z\TEMP.txt
cls
pause
goto CHECK

:CHECK
certutil -hashfile C:\Windows\Z\TEMP.txt SHA256 >> C:\Windows\Z\HASH.txt
cls
for /f "tokens=1,* delims=:" %%i in ('findstr /n  $ C:\Windows\Z\HASH.txt') do @(
        for /L %%a in (2,1,2) do @if %%i==%%a @echo %%j >> C:\Windows\Z\LOGIN.txt
)
del C:\Windows\Z\TEMP.txt
del C:\Windows\Z\HASH.txt
cls
for /f "delims=" %%a in (C:\Windows\Z\VKHASH.dll) do (set USER INP.1=%%a)
for /f "delims=" %%a in (C:\Windows\Z\LOGIN.txt) do (set USER INP.2=%%a)
if %USER INP.1%==%USER INP.2% (del C:\Windows\Z\LOGIN.txt
cls
pause
goto TOOLS
)

del C:\Windows\Z\LOGIN.txt
cls
echo.
echo  PASSWORD INCORRECT! TRY AGAIN!
echo.

pause
cls
goto VERIFICATION

:TOOLS
cls
echo.
echo.
echo  === ADMIN TOOL V 1.8 ===
echo.
echo.
echo  BACK TO THE MAIN MENU: MM
echo.
echo.
echo.
echo  TOOLS
echo.
echo  ACCEPTED: 1=SHUTDOWN 2=RESTART 3=LOGOUT (ONLY DIRECT) 4=CHANGE LOGIN PASSWORD 5=MENU (TASKS / PROGRAMS)
echo.
echo  6=MENU (DRIVES / FOLDERS / FILES) 7=SCANNOW 8=MENU (DATE / TIME) 9=SHOW WLAN KEY
echo. 
echo.
set /p EINGABE=TASK:

cls

if %EINGABE%==1 goto SHUTDOWN
if %EINGABE%==2 goto RESTART
if %EINGABE%==3 shutdown /l
if %EINGABE%==4 goto PWC
if %EINGABE%==5 goto TASKS
if %EINGABE%==6 goto FILES_T
if %EINGABE%==7 goto SCANNOW
if %EINGABE%==8 goto D_T
if %EINGABE%==9 goto SWP

if %EINGABE%==MM goto MAIN MENU

if %EINGABE% GTR 9 (echo.  
echo  NOT IN USE
echo.)

if %EINGABE% LSS 1 (echo.  
echo  NOT IN USE
echo.)

pause
cls
goto MAIN MENU

:SHUTDOWN
echo.
echo.
echo  === ADMIN TOOL V 1.8 ===
echo.
echo.
echo  PREVIOUS MENU: BACK
echo.
echo.
echo.
echo  SHUTDOWN
echo.
echo  ACCEPTED: 1=CANCEL (ONLY TIMED) 2=DIRECT SHUTDOWN 3=TIMED SHUTDOWN (30SEC) 4=USER DEFINED
echo.
echo.
set /p A=TASK:

cls

if %A%==1 (shutdown /a
msg * RESTART OR SHUTDOWN CANCELED SUCCESSFULLY!!!)
if %A%==2 shutdown /s /t 5
if %A%==3 shutdown /s /t 30
if %A%==4 goto SDUD

if %A%==BACK goto TOOLS

if %A% GTR 4 (echo.  
echo  NOT IN USE
echo.)

if %A% LSS 1 (echo.  
echo  NOT IN USE
echo.)

pause
cls
goto MAIN MENU

:SDUD
echo.
echo  SHUTDOWN (USER DEFINED)
echo.
echo.
set /p T=TIME (SEC):

cls

shutdown /s /t %T%

pause
cls
goto MAIN MENU

:RESTART
echo.
echo.
echo  === ADMIN TOOL V 1.8 ===
echo.
echo.
echo  PREVIOUS MENU: BACK
echo.
echo.
echo.
echo  RESTART
echo.
echo  ACCEPTED: 1=CANCEL (ONLY TIMED) 2=DIRECT RESTART 3=TIMED RESTART (30SEC) 4=USER DEFINED
echo.
echo.
set /p B=TASK:

cls

if %B%==1 (shutdown /a
msg * RESTART OR SHUTDOWN CANCELED SUCCESSFULLY!!!)
if %B%==2 shutdown /r /t 5
if %B%==3 shutdown /r /t 30
if %B%==4 goto RSUD

if %B%==BACK goto TOOLS

if %B% GTR 4 (echo.  
echo  NOT IN USE
echo.)

if %B% LSS 1 (echo.  
echo  NOT IN USE
echo.)

pause
cls
goto MAIN MENU

:RSUD
echo.
echo  RESTART (USER DEFINED)
echo.
echo.
set /p TI=TIME (SEC):

cls

shutdown /r /t %TI%

pause
cls
goto MAIN MENU

:TASKS
echo.
echo.
echo  === ADMIN TOOL V 1.8 ===
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

if %CHOICE%==BACK goto TOOLS

if %CHOICE% GTR 2 (echo.  
echo  NOT IN USE
echo.)

if %CHOICE% LSS 1 (echo.  
echo  NOT IN USE
echo.)

pause
cls
goto MAIN MENU

:START_TASK
echo.
echo.
echo  === ADMIN TOOL V 1.8 ===
echo.
echo.
echo  PREVIOUS MENU: BACK
echo.
echo.
echo.
echo  START
echo.
echo  STARTS AN TASK (PROGRAM)
echo.
echo.
echo  ACCEPTED: 1=POWERSHELL 2=COMPUTER MGMT 3=CONTROL 4=USER DEFINED
echo.
echo.
set /p ST=TASK:

cls

if %ST%==1 start C:\Windows\System32\WindowsPowerShell\V1.0\Powershell.exe
if %ST%==2 start C:\Windows\System32\compmgmt.msc
if %ST%==3 start C:\Windows\System32\control.exe
if %ST%==4 goto U_D_ST

if %ST%==BACK goto TOOLS

if %ST% GTR 4 (echo.  
echo  NOT IN USE
echo.)

if %ST% LSS 1 (echo.  
echo  NOT IN USE
echo.)

pause
cls
goto MAIN MENU

:U_D_ST
echo.
echo.
echo  START (USER DEFINED)
echo.
echo  STARTS AN TASK (PROGRAM)
echo.
echo. 
set /p UDST=TASKNAME OR FILE PATH:
cls

start %UDST%
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
echo  ADMINISTRATOR PERMISSIONS ARE REQUIRED TO END SYSTEM PROCESSES
echo.
echo  FOR THE CORRECT NAME OF ANY PROCESS OPEN TASKMANAGER AND GO TO DETAILS
echo.
echo.
echo  WARNING: QUITTING (KILLING) SYSTEM PROCESSES CAN CAUSE THE PC TO CRASH!!!
echo.
echo.
set /p TK=PROCESS NAME:

cls

taskkill /f /im %TK%
echo.

pause
cls
goto MAIN MENU

:PWC
echo.
echo  PASSWORD CHANGE
echo.
set /p LOGIN_NAME=LOGIN NAME:
echo.
set /p NEW_PASSWORD=NEW PASSWORD:
echo.
cls

net user %LOGIN_NAME% %NEW_PASSWORD%


pause
cls
goto MAIN MENU

:FILES_T
echo.
echo.
echo  === ADMIN TOOL V 1.8 ===
echo.
echo.
echo  PREVIOUS MENU: BACK
echo.
echo.
echo.
echo  FOLDER / FILES
echo.
echo  ACCEPTED: 1=ERASE 2=RMDIR 3=FORMAT 4=MOVE 5=MD 6=ENCRYPT / DECRYPT
echo.
echo.
set /p NUMBER=TASK:

cls

if %NUMBER%==1 goto ERASE
if %NUMBER%==2 goto RMDIR
if %NUMBER%==3 goto FORMAT
if %NUMBER%==4 goto MOVE
if %NUMBER%==5 goto MD
if %NUMBER%==6 goto EN_DECRYPT

if %NUMBER%==BACK goto TOOLS

if %NUMBER% GTR 6 (echo.  
echo  NOT IN USE
echo.)

if %NUMBER% LSS 1 (echo.  
echo  NOT IN USE
echo.)

pause
cls
goto MAIN MENU

:ERASE
echo.
echo  ERASE
echo.
echo  DELETES THE SPECIFIED FOLDERS AND FILES
echo.
echo  ADMINISTRATOR PERMISSIONS ARE REQUIRED TO DELETE SYSTEM FILES
echo.
echo.
echo  WARNING: DELETING SYSTEM FILES CAN CAUSE THE PC TO CRASH OR NOT BOOTING CORRECTLY ANYMORE!!!
echo.
echo.
set /p F=TARGET(S):
cls

erase %F%
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
echo.
set/p G=TARGET(S):
echo.
set /p H=TAGET LOCATION:
cls

move %G% %H%
echo.

pause
cls
goto MAIN MENU

:FORMAT
echo.
echo  FORMAT
echo.
echo  COMPLETELY DELETES EVERY FOLDER/FILE ON THE SPECIFIED DRIVE!
echo.
echo.
echo  WARNING: ALL FILES / FOLDERS THIS DISK CONTAINS WILL BE COMPLETLY ERASED! THEY ARE GONE FOREVER!!!
echo.
echo.
set /p E=TARGET (DRIVE):
cls

if %E%==C:(echo set WshShell = WScript.CreateObject("WScript.Shell") > %tmp%\CONFIRM.vbs
echo WScript.Quit (WshShell.Popup( "Do you really want to format the System Drive C: This could ruin your PC!" ,10 ,"EXECUTE?", vbExclamation + 4)) >> %tmp%\CONFIRM.vbs
cscript /nologo %tmp%\CONFIRM.vbs
if %errorlevel%==6 (
echo FORMATTING
pause
)
if %errorlevel%==7 (
del %tmp%\TEST.vbs
pause
goto FORMAT
)
if %errorlevel%==-1 (
del %tmp%\TEST.vbs
pause
goto FORMAT
)
pause
del %tmp%\TEST.vbs

format %E%
echo.

pause
cls
goto MAIN MENU

:MD
echo.
echo  MD
echo.
echo  CREATES AN FOLDER/SUBFOLDER ON THE SPECIFIED DRIVE
echo.
echo  FOR EXAMPLE: DRIVE:[C:\] NAME: [PROGRAMS] = C:\PROGRAMS  YOU CAN ALSO CREATE A FOLDER INTO AN FOLDER C:\PROGRAMS\Twitch
echo.
echo.
set /p I=TARGET + NAME:
cls

md %I%
echo.

pause
cls
goto MAIN MENU

:RMDIR
echo.
echo  RMDIR
echo.
echo  REMOVES (DELETES) AN DIRECTORY
echo.
echo  ONLY WORKS OF DIRECTORY IS EMPTY!
echo.
echo.
echo  VERY USEFUL IN THE C:\WINDOWS FOLDER, BECAUSE YOU CAN'T DELETE FOLDERS THERE VIA CMD (ONLY THE CONTENTS)
echo.
echo.
set /P PATH=TARGET LOCATION:

cls

rmdir %PATH%
echo.

pause
cls
goto MAIN MENU

:EN_DECRYPT
echo.
echo.
echo  === ADMIN TOOL V 1.8 ===
echo.
echo.
echo  PREVIOUS MENU: BACK
echo.
echo.
echo.
echo  EN / DECRYPTION
echo.
echo  TOOL FOR FILE / FOLDER ENCRYPTION
echo.
echo.
echo  ACCEPTED: 1=ENCRYPT 2=DECRYPT
echo.
echo.
set /p EN_DECR=TASK:

cls

if %EN_DECR%==1 goto ENCRYPT
if %EN_DECR%==2 goto DECRYPT

if %EN_DECR%==BACK goto FILES_T

if %EN_DECR% GTR 2 (echo.  
echo  NOT IN USE
echo.)

if %EN_DECR% LSS 1 (echo.  
echo  NOT IN USE
echo.)

pause
cls
goto MAIN MENU

:ENCRYPT
echo.
echo  ENCRYPT
echo.
echo  WITH THIS COMMAND YOU CAN ENCRYPT FILES AND FOLDERS
echo.
echo  THE FILES / FOLDERS WILL BE INVISIBLE AND INACCESSABLE
echo.
echo.
set /p ENCRYPTION=FILE OR FOLDER:
cls

attrib %ENCRYPTION% +R +S +H

pause
cls
goto MAIN MENU

:DECRYPT
echo.
echo  DECRYPT
echo.
echo  WITH THIS COMMAND YOU CAN DECRYPT FILES AND FOLDERS
echo.
echo  THE FILES / FOLDERS WILL BE BACK TO NORMAL (VISIBLE AND ACCESABLE)
echo.
echo.
set /p DECRYPTION=FILE OR FOLDER:
cls

attrib %ENCRYPTION% -R -S -H

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
sfc /scannow
echo.

pause
cls
goto MAIN MENU

:D_T
echo.
echo.
echo  === ADMIN TOOL V 1.8 ===
echo.
echo.
echo  PREVIOUS MENU: BACK
echo.
echo.
echo.
echo  DATE / TIME
echo.
echo  ACCEPTED: 1=DATE 2=TIME
echo.
echo.
set /p D+T=TASK:

cls

if %D+T%==1 goto DATE
if %D+T%==2 goto TIME

if %D+T%==BACK goto TOOLS

if %D+T% GTR 2 (echo.  
echo  NOT IN USE
echo.)

if %D+T% LSS 1 (echo.  
echo  NOT IN USE
echo.)

pause
cls
goto MAIN MENU

:DATE
echo.
echo  DATE
echo.
echo  CHANGES THE DATE
echo.
echo.

date
echo.

pause
cls
goto MAIN MENU

:TIME
echo.
echo  TIME
echo.
echo  CHANGES THE TIME
echo.
echo.

time
echo.

pause
cls
goto MAIN MENU

:SWP
echo.
echo  SHOW WLAN KEY
echo.
echo  SHOWS INFOS ABOUT THE ENTERED WLAN (KEY INCLUDED)
echo.
echo.
set /p WLAN_NAME=WLAN NAME (WONT WORK IF THE NAME CONTAINS A SPACE):

pause
cls
goto SHOW_KEY

:SHOW_KEY
echo.
netsh wlan show profile %WLAN_NAME% key=clear

pause
cls
goto MAIN MENU
