@echo off
setlocal

REM REM Run broadcast.bat three times with a 1-minute interval
REM for /L %%i in (1,1,3) do (
    REM call broadcast.bat server is shutting down due to schedule restart please wait 10 mins. thank you
    REM timeout /t 60 /nobreak
REM )

REM REM Wait for the remaining 2 minutes
REM timeout /t 5 /nobreak
call ./scripts/docker-checker.bat
timeout /t 5 /nobreak
REM Run down.bat
call ./scripts/down.bat
timeout /t 5 /nobreak
call ./scripts/up.bat
endlocal