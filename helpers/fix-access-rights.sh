#!/usr/bin/env bash

source functions.sh

CURRENT_USER_ID=$(id -u)
DOCKER_COMPOSE_CMD=$(find_docker_compose_command)

$DOCKER_COMPOSE_CMD exec cakephp chown www-data:www-data /var/www/html
$DOCKER_COMPOSE_CMD exec cakephp chown -R $CURRENT_USER_ID:www-data /var/www/html/.*
