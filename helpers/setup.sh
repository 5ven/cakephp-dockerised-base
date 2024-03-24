#!/usr/bin/env bash

source functions.sh

load_env_variables "../.env"

# Check if the function succeeded
if [ $? -ne 0 ]; then
    exit 1
fi

DOCKER_COMPOSE_CMD=$(find_docker_compose_command)

# Define directories
CAKEPHP_APP_DIR=../app
CAKEPHP_GIT_REPO=https://github.com/cakephp/app.git
CAKEPHP_BRANCH="5.x"
CAKEPHP_CONTAINER_NAME=cakephp
CURRENT_USER_ID=$(id -u)

# Clone CakePHP app skeleton if the app directory is empty
if [ -d "$CAKEPHP_APP_DIR" ]; then
    # Check if .gitkeep is the only file in the directory
    if [ "$(ls -A $CAKEPHP_APP_DIR | grep -v .gitkeep | wc -l)" -eq 0 ]; then
        echo "Cloning CakePHP app skeleton..."
        rm $CAKEPHP_APP_DIR/.gitkeep
        git clone --branch $CAKEPHP_BRANCH $CAKEPHP_GIT_REPO $CAKEPHP_APP_DIR
    else
        echo "CakePHP app directory exists and has files other than .gitkeep. Skipping clone."
    fi
else
    echo "Cloning CakePHP app skeleton..."
    git clone --branch $CAKEPHP_BRANCH $CAKEPHP_GIT_REPO $CAKEPHP_APP_DIR
fi

# Start Docker containers
echo "Starting Docker containers..."
$DOCKER_COMPOSE_CMD up -d

echo "Docker containers started. CakePHP app is being served by Nginx and PHP-FPM."

# Check for container status
echo "Waiting for containers to be fully started..."
while [ "$($DOCKER_COMPOSE_CMD ps $CAKEPHP_CONTAINER_NAME | grep 'Up')" == "" ]; do
    echo "Waiting for the CakePHP container to start..."
    sleep 5
done

# Install Composer dependencies within the CakePHP container
echo "Installing CakePHP dependencies with Composer inside the Docker container..."
$DOCKER_COMPOSE_CMD exec cakephp composer install

# Update permissions for the app directory
echo "Updating permissions..."
$DOCKER_COMPOSE_CMD exec cakephp chown www-data:www-data /var/www/html
$DOCKER_COMPOSE_CMD exec cakephp chown -R $CURRENT_USER_ID:www-data /var/www/html/.*

echo "CakePHP dependencies installed. CakePHP app is being served by Nginx and PHP-FPM."