export PATH="/usr/local/opt/openssl/bin:$PATH"

# Laradock helper command
wspace() {
    cmd="docker exec -it --user=laradock pgrf_workspace_1"
    if [ $# == 0 ]; then
        echo "Workspace requires some argument"
        return 1
    fi

    if [ $1 == "test" ]; then
        command $cmd vendor/bin/phpunit "${@:2}"
    elif [ "$1" == "arty" ]; then
        command $cmd php artisan "${@:2}"
    else
        command $cmd "$@"
    fi
}

