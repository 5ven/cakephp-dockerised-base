find_docker_compose_command() {
    if command -v docker-compose &> /dev/null; then
        echo "docker-compose"
    elif command -v docker compose &> /dev/null; then
        echo "docker compose"
    else
        echo "error: Neither docker-compose nor docker compose command was found" >&2
        return 1
    fi
}

load_env_variables() {
    local env_file_path="$1"

    if [ -f "$env_file_path" ]; then
        export $(grep -v '^#' "$env_file_path" | xargs)
    else
        echo ".env file not found at $env_file_path"
        return 1
    fi
}
