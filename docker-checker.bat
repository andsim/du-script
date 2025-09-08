@echo off
setlocal

:checkDocker
REM Try to get Docker info
docker info >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    echo Waiting for Docker to start...
    timeout /t 2 >nul
    goto checkDocker
)
