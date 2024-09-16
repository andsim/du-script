@echo off
setlocal

REM Run broadcast.bat three times with a 1-minute interval
for /L %%i in (1,1,3) do (
    call broadcast.bat server is shutting down due to Auto update please wait 10 mins. thank you
    timeout /t 60 >nul
)

REM Wait for the remaining 2 minutes
timeout /t 5 >nul 
call down.bat
timeout /t 5 >nul
call update-server.bat
timeout /t 5 >nul
call up.bat