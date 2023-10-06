@echo off

title ENCRYPTING...

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
attrib C:\Windows\Z\PASSWORD.txt -r -s -h
certutil -hashfile C:\Windows\Z\PASSWORD.txt SHA256 >> C:\Windows\Z\TEMP.txt
del C:\Windows\Z\PASSWORD.txt

attrib C:\Windows\Z\PWHASH.dll -r -s -h
del C:\Windows\Z\PWHASH.dll
cls

for /f "tokens=1,* delims=:" %%i in ('findstr /n  $ C:\Windows\Z\TEMP.txt') do @(
        for /L %%a in (2,1,2) do @if %%i==%%a @echo %%j >> C:\Windows\Z\PWHASH.dll
)
del C:\Windows\Z\TEMP.txt
attrib C:\Windows\Z\PWHASH.dll +r +s +h

attrib C:\Windows\Z\VERIFICATION_KEY.txt -r -s -h
certutil -hashfile C:\Windows\Z\VERIFICATION_KEY.txt SHA256 >> C:\Windows\Z\TEMP.txt
del C:\Windows\Z\VERIFICATION_KEY.txt

attrib C:\Windows\Z\VKHASH.dll -r -s -h
del C:\Windows\Z\VKHASH.dll
cls

for /f "tokens=1,* delims=:" %%i in ('findstr /n  $ C:\Windows\Z\TEMP.txt') do @(
        for /L %%a in (2,1,2) do @if %%i==%%a @echo %%j >> C:\Windows\Z\VKHASH.dll
)
del C:\Windows\Z\TEMP.txt
attrib C:\Windows\Z\VKHASH.dll +r +s +h

attrib C:\Windows\Z\MASTER_PASSWORD.txt -r -s -h
certutil -hashfile C:\Windows\Z\MASTER_PASSWORD.txt SHA256 >> C:\Windows\Z\TEMP.txt
del C:\Windows\Z\MASTER_PASSWORD.txt
cls

for /f "tokens=1,* delims=:" %%i in ('findstr /n  $ C:\Windows\Z\TEMP.txt') do @(
        for /L %%a in (2,1,2) do @if %%i==%%a @echo %%j >> C:\Windows\Z\MPHASH.dll
)
del C:\Windows\Z\TEMP.txt
attrib C:\Windows\Z\MPHASH.dll +r +s +h
attrib C:\Windows\Z +r +s +h

cls
exit