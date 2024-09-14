#!/bin/bash

# Check if the parameter is provided
if [ -z "$*" ]; then
    echo "Error: Sentence is required."
    exit 1
fi

# Function to determine whether to use 'docker-compose' or 'docker compose'
function docker_compose_command() {
    if command -v docker-compose >/dev/null 2>&1; then
        # Old 'docker-compose' command is available
        echo "docker-compose"
    elif docker compose version >/dev/null 2>&1; then
        # New 'docker compose' subcommand is available
        echo "docker compose"
    else
        echo "Error: Neither 'docker-compose' nor 'docker compose' is available."
        exit 1
    fi
}

DOCKER_COMPOSE_CMD=$(docker_compose_command)

$DOCKER_COMPOSE_CMD run --rm --entrypoint /usr/bin/curl sandbox -v -H 'Content-Type: application/json' -d '{"message":"'"$*"'"}' http://orleans:10111/playerdirectory/popup/all