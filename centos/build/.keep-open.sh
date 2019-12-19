#!/bin/bash

# If specified, keep container open, allowing user to log in with bash
function keep-open {
    if [[ $1 == "--keep" ]]; then 
    cat << EOF
Snort3 docker container started!
You may now log in into the container with the following command:
docker exec -it $(docker ps -q) /bin/bash
EOF
    sleep infinity
    fi
}
