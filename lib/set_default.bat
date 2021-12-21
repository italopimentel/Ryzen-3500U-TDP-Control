@echo off
if _%1_==_payload_  goto :payload

:getadmin
    echo %~nx0: elevating self
    set vbs=%temp%\getadmin.vbs
    echo Set UAC = CreateObject^("Shell.Application"^)                >> "%vbs%"
    echo UAC.ShellExecute "%~s0", "payload %~sdp0 %*", "", "runas", 1 >> "%vbs%"
    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
goto :eof

:payload
SET CurrentDir="%~dp0"
cd %CurrentDir%
ryzenadj --stapm-limit=20000 --fast-limit=25000 --slow-limit=12000 --tctl-temp=75

echo.
echo...The Ryzen 3500U has been set up to default!
echo.

pause