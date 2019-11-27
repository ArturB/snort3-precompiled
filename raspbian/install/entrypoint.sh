#!/bin/bash

# If specified, keep container open, allowing user to log in with bash
if [[ $1 == "--keep" ]]; then 
echo -e \
'Snort3 docker container started!\
You may now log in into the container with the following command:\
docker exec -it $(docker ps -q) /bin/bash' ; sleep infinity
fi

# Install snort
apt-get update && apt-get install -y $DIST_DIR/snort3*

# Basic installation check
snort --daq-dir=/usr/lib/x86_64-linux-gnu/daq --daq-list
snort -V
