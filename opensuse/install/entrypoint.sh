#!/bin/bash

# If specified, keep container open, allowing user to log in with bash
if [[ $1 == "--keep" ]]; then 
echo -e \
'Snort3 docker container started!\
You may now log in into the container with the following command:\
docker exec -it $(docker ps -q) /bin/bash' ; sleep infinity
fi

# Copy the RPM package from dist directory, install snort and check it
cp -v $( find /dist/opensuse -name *$OPENSUSE_VERSION*.rpm ) / 
zypper --non-interactive install --allow-unsigned-rpm -y /snort3*
snort -V
snort --daq-dir=/usr/lib64/daq --daq-list
