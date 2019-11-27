#!/bin/bash

# Exit if any command fails
set -e

# If specified, keep container open, allowing user to log in with bash
if [[ $1 == "--keep" ]]; then 
echo -e \
'Snort3 docker container started!\
You may now log in into the container with the following command:\
docker exec -it $(docker ps -q) /bin/bash' ; sleep infinity
fi

# Install snort
apt-get update && apt-get install -y $DIST_DIR/snort3*$DIST_NAME*.deb

# Basic installation check
snort --daq-dir=$TARGET_LIBRARY_PATH/daq --daq-list
snort -V
