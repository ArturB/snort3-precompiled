#!/bin/bash

# Exit if any command fails
set -e

# If specified, keep container open, allowing user to log in with bash
function keep-open {
    echo 'Snort3 docker container started!'
    echo 'You may now log in into the container with the following command:'
    echo 'docker exec -it $(docker ps -q) /bin/bash'
    sleep infinity
}

# Run container and process parameters:
case $1 in
    keep) # keep container open, allowing to log into it interactively
        keep-open
    ;;
    build) # re-build snort3 from source
        /build-snort.sh
        /build-package.sh
    ;;
    export) # export package to host
        /export-package.sh
    ;;
    install) # install snort to verify package validity
        /install-snort.sh
        /test-snort.sh
    ;;
    *)
        echo "$@: command not recognized!"
        exit 1
    ;;
esac
