#!/bin/bash

# Exit if any command fails
set -e

# If specified, keep container open, allowing user to log in with bash
source /script/keep-open.sh

# Run container and process parameters:
case $1 in
    keep) keep-open ;; # keep container open, allowing to log into it interactively
    build)             # re-build snort3 from source
        /script/build-snort.sh
        /script/snort-extra.sh
        /script/build-package.sh
    ;;
    copy)    /copy-package.sh ;; # copy package to host
    install) /install-snort.sh   # install snort to verify package validity
esac
