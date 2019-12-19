#!/bin/bash

# If specified, keep container open, allowing user to log in with bash
function keep-open {
    echo 'Snort3 docker container started!'
    echo 'You may now log in into the container with the following command:'
    echo 'docker exec -it $(docker ps -q) /bin/bash'
    sleep infinity
}
