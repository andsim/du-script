setlocal

REM Check if the parameter is provided
if "%*"=="" (
    echo Error: Sentence is required.
    exit /b 1
)

docker-compose run --entrypoint /usr/bin/curl sandbox -v -H "Content-Type: application/json" -d "{\"message\":\"%*\"}" http://orleans:10111/playerdirectory/popup/all

endlocal
