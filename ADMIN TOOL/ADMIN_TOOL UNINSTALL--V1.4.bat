@echo off

title ADMIN TOOL UNINSTALL V 1.4

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

:CHECK
echo.
echo.
echo  === UNINSTALL ADMIN_TOOL V 1.4 ===
echo.
echo.
echo  LOGIN
echo.
echo.
echo  PLEASE ENTER YOUR MASTER PASSWORD TO CONTINUE... (FROM THE SETUP)
echo.
set /p MPW=PASSWORD:
cls
echo %MPW% > C:\Windows\Z\TEMP.txt
cls
pause
goto TEST

:TEST
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
goto MAIN MENU
)

del C:\Windows\Z\LOGIN.txt
cls
echo.
echo  PASSWORD INCORRECT! TRY AGAIN!
echo.

pause
cls
goto CHECK

:MAIN MENU
cls
echo.
echo.
echo  === UNINSTALL ADMIN_TOOL V 1.4 ===
echo.
echo.
echo  THIS IS THE UNINSTALL PROGRAM FOR ADMIN_TOOL
echo.
echo.
echo.
echo  I HOPE YOU HAVE / HAD FUN USING THIS PROGRAM AND I HOPE IT IS / WAS USEFUL...
echo.
echo.
echo  INFO: THIS PROGRAM CAN ONLY UNINSTALL THE PROGRAMS, IF THEY ARE STORED IN COMMON PLACES
echo.
echo  SUCH AS C:\ OR C:\Documents OR ON THE DESKTOP
echo.
echo.
echo.
echo  PLEASE CHOOSE
echo.
echo.
echo  THERE ARE 2 OPTIONS TO CONTINUE
echo.
echo.
echo  1=UNINSTALL AND DELETE EVERYTHING (FULL UNINSTALL) 2=ONLY DELETE ALL CREATED FILES (RESET)
echo.
echo.
set /p OPTION=OPTION:

cls

if %OPTION%==1 goto FULL-UNINSTALL
if %OPTION%==2 goto DEL-FOLDERS/FILES

if %OPTION% GTR 2 (echo.
echo  NOT IN USE
echo.)
if %OPTION% LSS 1 (echo.
echo  NOT IN USE
echo.)

pause
cls
goto MAIN MENU

:FULL-UNINSTALL
echo.
echo.
echo  === UNINSTALL ADMIN_TOOL V 1.4 ===
echo.
echo.
echo  BACK TO THE MAIN MENU: MM
echo.
echo.
echo.
echo  THIS OPTION WILL UNINSTALL / DELETE EVERYTHING!!!
echo.
echo.
echo  THE PROGRAMS AND ALL ASSOCIATED DATA WILL BE DELETED!!!
echo.
echo.
set /p INPUT=ARE YOU SURE? (Y/N):
cls

if %INPUT%==Y goto START UNINSTALL
if %INPUT%==N exit
if %INPUT%==y goto START UNINSTALL
if %INPUT%==n exit

pause
cls
goto MAIN MENU

:START UNINSTALL
attrib C:\Windows\Z -R -S -H

attrib C:\Windows\Z\PWHASH.dll -R -S -H
attrib C:\Windows\Z\VKHASH.dll -R -S -H
attrib C:\Windows\Z\MPHASH.dll -R -S -H

del C:\Windows\Z\PWHASH.dll
del C:\Windows\Z\VKHASH.dll
del C:\Windows\Z\MPHASH.dll

rmdir /s /q C:\Windows\Z

del /F /Q C:\ADMIN_TOOL--V1.6.bat
del /F /Q C:\ADMIN_TOOL_SETUP--V1.2.bat
del /F /Q C:\ADMIN_TOOL_HELP--V1.5.bat

del /F /Q %userprofile%\Desktop\ADMIN_TOOL--V1.6.bat
del /F /Q %userprofile%\Desktop\ADMIN_TOOL_SETUP--V1.2.bat
del /F /Q %userprofile%\Desktop\ADMIN_TOOL_HELP--V1.5.bat

del /F /Q %userprofile%\Documents\ADMIN_TOOL--V1.6.bat
del /F /Q %userprofile%\Documents\ADMIN_TOOL_SETUP--V1.2.bat
del /F /Q %userprofile%\Documents\ADMIN_TOOL_HELP--V1.5.bat

echo set WshShell = WScript.CreateObject("WScript.Shell") > %tmp%\tmp.vbs
echo WScript.Quit (WshShell.Popup( "Successfully deleted all generated Folders/Files and the programs themselves." ,10 ,"Reset Complete", vbinformation + 0)) >> %tmp%\tmp.vbs
cscript /nologo %tmp%\tmp.vbs
if %errorlevel%==1 (
  exit
) else (
  exit
)
del %tmp%\tmp.vbs
exit

:DEL-FOLDERS/FILES
echo.
echo.
echo  === UNINSTALL ADMIN_TOOL V 1.4 ===
echo.
echo.
echo  BACK TO THE MAIN MENU: MM
echo.
echo.
echo.
echo  THIS OPTION WILL ONLY DELETE ALL CREATED FOLDERS / FILES!!!
echo.
echo.
set /p INPUT=ARE YOU SURE? (Y/N):
cls

if %INPUT%==Y goto START RESET
if %INPUT%==N exit
if %INPUT%==y goto START RESET
if %INPUT%==n exit

pause
cls
goto MAIN MENU

:START RESET

attrib C:\Windows\Z\PWHASH.dll -R -S -H
attrib C:\Windows\Z\VKHASH.dll -R -S -H
attrib C:\Windows\Z\MPHASH.dll -R -S -H

del C:\Windows\Z\PWHASH.dll
del C:\Windows\Z\VKHASH.dll
del C:\Windows\Z\MPHASH.dll

del /F /Q C:\Windows\Z

echo set WshShell = WScript.CreateObject("WScript.Shell") > %tmp%\tmp.vbs
echo WScript.Quit (WshShell.Popup( "Successfully deleted all generated Folders/Files." ,10 ,"Reset Complete", vbinformation + 0)) >> %tmp%\tmp.vbs
cscript /nologo %tmp%\tmp.vbs
if %errorlevel%==1 (
  exit
) else (
  exit
)
del %tmp%\tmp.vbs

exit