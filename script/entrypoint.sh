#!/bin/bash

# Exit if any command fails
set -e

# If specified, keep container open, allowing user to log in with bash


# Run container and process parameters:
case $1 in
    keep) # keep container open, allowing to log into it interactively
        source /.keep-open.sh
        keep-open
    ;;
    build) # re-build snort3 from source
        /.snort.sh
        /.snort-extra.sh
        /build-package.sh
    ;;
    copy) # copy package to host
        /copy-package.sh
    ;;
    install) # install snort to verify package validity
        /install-snort.sh
        /.test-snort.sh
    ;;
esac
