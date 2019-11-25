#!/bin/bash

# If specified, keep container open, allowing user to log in with bash
if [[ $1 == "--keep" ]]; then 
echo -e \
'Snort3 docker container started!\
You may now log in into the container with the following command:\
docker exec -it $(docker ps -q) /bin/bash' ; sleep infinity
fi

# Copy the RPM package from dist directory and install snort
cp -v $( find $DIST_DIR -name *$FEDORA_VERSION*.rpm ) / 
dnf install -y /snort3* 

# Basic installation check
snort --daq-dir=/usr/lib64/daq --daq-list
snort -V
