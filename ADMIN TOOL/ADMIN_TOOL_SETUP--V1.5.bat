@echo off

title ADMIN TOOL SETUP V 1.5

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

cls
echo.
echo.
echo  === ADMIN TOOL SETUP V 1.5 ===
echo.
echo.
echo  --------------------------------------
echo  ADMINISTRATOR PERMISSIONS CONFIRMED...
echo  --------------------------------------
echo.

timeout /t 4
cls
if exist "C:\Windows\Z\MPHASH.dll" goto LOGIN
if not exist "C:\Windows\Z\MPHASH.dll" goto START
cls

:LOGIN
echo.
echo.
echo  === ADMIN TOOL SETUP V 1.5 ===
echo.
echo.
echo  LOGIN
echo.
echo.
echo  PLEASE ENTER YOUR MASTER PASSWORD TO CONTINUE...
echo.
set /p MPW=PASSWORD:
cls
echo %MPW% > C:\Windows\Z\TEMP.txt
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
for /f "delims=" %%a in (C:\Windows\Z\MPHASH.dll) do (set USER INP.1=%%a)
for /f "delims=" %%a in (C:\Windows\Z\LOGIN.txt) do (set USER INP.2=%%a)
if %USER INP.1%==%USER INP.2% (del C:\Windows\Z\LOGIN.txt
cls
pause
goto EXECUTE
)

del C:\Windows\Z\LOGIN.txt
cls
echo.
echo  PASSWORD INCORRECT! TRY AGAIN!
echo.

pause
cls
goto LOGIN


:START
cls
echo.
echo.
echo  === ADMIN TOOL SETUP V 1.5 ===
echo.
echo.
echo  THIS IS THE SETUP FOR THE ADMIN TOOL PROGRAM
echo.
echo.
echo  IN THIS SETUP, YOU CAN SET ALL THE PASSWORDS NEEDED FOR THE APPLICATION
echo.
echo  YOU WILL NEED A PASSWORD, TO GAIN ACCESS TO THE MAIN MENU OF THE ADMIN TOOL
echo.
echo  THEN YOU NEED A SECOND PASSWORD, FOR THE TOOL MENU
echo.
echo.
echo  NOTE:THE SETUP ONLY WORKS IN THIS FOLDER! ALL OTHER PROGRAMS CAN BE MOVED/COPIED
echo.
echo.
echo  THIS SETUP WILL CREATE A FOLDER NAMED Z TO THIS LOCATION C:\Windows
echo.
echo  THERE, YOUR PASSWORDS WILL BE HASHED (ENCRYPTED) AND THEN STORED INVISIBLY
echo.
echo  THESE FILES CANNOT SIMPLY BE EDITED OR DELETED
echo.
echo.
echo.

set /p EINGABE=DO YOU WANT TO LEARN MORE ABOUT THE SAFETY OF THE LOGIN/PASSWORD SYSTEM? (Y/N):
cls
if %EINGABE%==Y goto INFO
if %EINGABE%==N goto IMPORTANT
if %EINGABE%==y goto INFO
if %EINGABE%==n goto IMPORTANT
cls
goto IMPORTANT

:IMPORTANT
echo.
echo.
echo  === ADMIN TOOL SETUP V 1.5 ===
echo.
echo.
echo  TO CHANGE YOUR PASSWORDS, YOU SIMPLY HAVE TO START THIS SETUP AGAIN AND
echo.
echo  SET YOUR NEW PASSWORDS. THE OLD ONES WILL THEN BE OVERWRITTEN    BUT...
echo.
echo.
echo.
echo                         !!!IMPORTANT!!!
echo.
echo  TO PREVENT, THAT OTHERS CAN CHANGE YOUR PASSWORDS, YOU WILL ALSO HAVE TO
echo.
echo  SET A MASTER PASSWORD, THAT YOU WILL NEED TO CHANGE YOUR PASSWORDS AFTER YOU
echo.
echo  HAVE SET THEM FOR THE FIRST TIME
echo.
timeout /t 20

cls
goto EXECUTE

:EXECUTE
cls
echo.
echo.
echo.
echo  === ADMIN TOOL SETUP V 1.5 ===
echo.
echo.
echo  THIS PROGRAM WILL CREATE FOLDERS AND FILES ON OUR PC
echo.
echo.
set /p YESNO=DO YOU WANT TO RUN THE SETUP? (Y/N):

cls
if %YESNO%==Y goto PASSWORD
if %YESNO%==N exit
if %YESNO%==y goto PASSWORD
if %YESNO%==n exit

cls
goto CHECK

:PASSWORD
md C:\Windows\Z
attrib C:\Windows\Z\PASSWORD.dll -R -S -H
cls
echo.
echo.
echo  === ADMIN TOOL SETUP V 1.5 ===
echo.
echo.
echo  FIRST YOU WILL NEED A PASSWORD TO ENTER THE MAIN MENU...
echo.
echo  ACCEPTED: LETTERS AND NUMBERS E.G. Peter2949
echo.
echo.
echo.
echo  WARNING: WITH THIS PROGRAM OTHERS COULD DAMAGE YOUR COMPUTER OR GET SENSITIVE INFORMATIONS
echo.
echo  THE PASSWORD SHOULD BE A STRONG ONE!!!
echo.
echo.
set /p PASSWORD=ENTER YOUR PASSWORD HERE:
echo.

echo %PASSWORD% > C:\Windows\Z\PASSWORD.txt
pause
attrib C:\Windows\Z\PASSWORD.txt +R +S +H
cls
goto KEY_E

:KEY_E
attrib C:\Windows\Z\VERIFICATION_KEY.txt -R -S -H
cls
echo.
echo.
echo  === ADMIN TOOL SETUP V 1.5 ===
echo.
echo.
echo  THEN YOU WILL NEED A VERFIFICATION KEY TO ENTER THE TOOL MENU...
echo.
echo  ACCEPTED: LETTERS AND NUMBERS E.G. Peter2949
echo.
echo.
echo.
echo  WARNING: IN THE TOOLS MENU, OTHERS COULD DAMAGE YOUR COMPUTER IN SOME WAYS!!!
echo.
echo  THE PASSWORD SHOULD BE STRONGER THAN THE FIRST ONE AND NEVER BE THE SAME!!!
echo.
echo.
set /p VERIFICATION-KEY=ENTER YOUR VERIFICATION-KEY HERE:
echo.

echo %VERIFICATION-KEY% > C:\Windows\Z\VERIFICATION_KEY.txt
pause
attrib C:\Windows\Z\VERIFICATION_KEY.txt +R +S +H
cls
goto CHANGE_KEY

:CHANGE_KEY

if exist "C:\Windows\Z\MASTER_PASSWORD.txt" goto END
attrib C:\Windows\Z\MASTER_PASSWORD.txt -R -S -H
cls

echo.
echo.
echo  === ADMIN TOOL SETUP V 1.5 ===
echo.
echo.
echo  FINALLY, YOU NEED THE MASTER PASSWORD TO CHANGE THE OTHER PASSWORDS
echo.
echo  ACCEPTED: LETTERS, NUMBERS AND SYBOLS E.G. Pe:ter_29+49!
echo.
echo.
echo.
echo  WARNING: THIS IS THE MASTER PASSWORD NEEDED TO CHANGE THE PASSWORDS!!!
echo.
echo  THE PASSWORD SHOULD BE VERY STRONG!!!
echo.
echo  CHOOSE YOUR PASSWORD WISELY... YOU CAN'T CHANGE IT ANYMORE!!!
echo.
echo.
set /p CHANGE-KEY=ENTER YOUR MASTER PASSWORD HERE:
echo.

echo %CHANGE-KEY% > C:\Windows\Z\MASTER_PASSWORD.txt
pause
attrib C:\Windows\Z\MASTER_PASSWORD.txt +R +S +H
cls
goto END

:INFO
echo.
echo  INFO
echo.
echo.
echo  HASHING IS AN ENCRYPTION METHOD IN WHICH THE DATA GETS CONVERTED INTO HEXADECIMAL NUMBERS
echo.
echo  THE ORIGINAL DATA CAN NO LONGER BE DETERMINED FROM THE RESULTING STRING OF NUMBERS
echo.
echo.
echo  THESE FILES WITH THE ENCRYPTED PASSWORDS ARE SAVED IN THE GENERATED FOLDER AND THEY ARE
echo.
echo  INVISIBLE (THE FOLDER TOO) AND PROTECTED AGAINST SIMPLY DELETING THEM
echo.
echo  ALSO YOU WILL NEED ADMINISTRATOR PRIVILEGES TO CHANGE OR DELETE THE FOLDER AND ITS FILES
echo.
echo.
pause
cls
goto IMPORTANT

:END
echo.
echo.
echo  === ADMIN TOOL SETUP V 1.5 ===
echo.
echo.
echo  -----------------
echo  SETUP FINISHED!!!
echo  -----------------
echo.

pause
attrib C:\Windows\Z\PASSWORD.txt +R +S +H
attrib C:\Windows\Z\VERIFICATION_KEY.txt +R +S +H
attrib C:\Windows\Z\MASTER_PASSWORD.txt +R +S +H
cls

cd %~dp0%
copy ENCRYPT_PASSWORDS.bat C:\Windows\Z
attrib C:\Windows\Z\ENCRYPT_PASSWORDS.bat +R +S +H
cls
echo set WshShell = WScript.CreateObject("WScript.Shell") > %tmp%\S_Filenotfound.vbs
echo WScript.Quit (WshShell.Popup( "File not Found! [ ENCRYPT_PASSWORDS.bat ]" ,10 ,"ERROR 404", vbCritical + 0)) >> %tmp%\S_Filenotfound.vbs
if not exist "C:\Windows\Z\ENCRYPT_PASSWORDS.bat" (
cscript /nologo %tmp%\S_Filenotfound.vbs
if %errorlevel%==1 (
  del %tmp%\S_Filenotfound.vbs
) else (
  del %tmp%\S_Filenotfound.vbs
)
del %tmp%\S_Filenotfound.vbs
attrib C:\Windows\Z\PASSWORD.txt -R -S -H
attrib C:\Windows\Z\VERIFICATION_KEY.txt -R -S -H
attrib C:\Windows\Z\MASTER_PASSWORD.txt -R -S -H
del C:\Windows\Z\PASSWORD.txt
del C:\Windows\Z\VERIFICATION_KEY.txt
del C:\Windows\Z\MASTER_PASSWORD.txt
cls
echo.
echo  PLEASE MAKE SURE TO RUN THE SETUP WITHIN THE DOWNLOADED FOLDER, THAT CONTAINS THE FILE ENCRYPT_PASSWORDS.bat
echo.
pause
exit)
cls
echo set WshShell = WScript.CreateObject("WScript.Shell") > %tmp%\S_Finished.vbs
echo WScript.Quit (WshShell.Popup( "Successfully generated and saved all requiered folders and files." ,10 ,"Installation complete", vbInformation + 0)) >> %tmp%\S_Finished.vbs
cscript /nologo %tmp%\S_Finished.vbs
if %errorlevel%==1 (
  start C:\Windows\Z\ENCRYPT_PASSWORDS.bat
) else (
  start C:\Windows\Z\ENCRYPT_PASSWORDS.bat
)
del %tmp%\S_Finished.vbs
del %tmp%\S_Filenotfound.vbs

del ENCRYPT_PASSWORDS.bat

exit