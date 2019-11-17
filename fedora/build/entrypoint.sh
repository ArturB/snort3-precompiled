#!/bin/bash

# If specified, keep container open, allowing user to log in with bash
if [[ $1 == "--keep" ]]; then 
echo -e \
'Snort3 docker container started!\
You may now log in into the container with the following command:\
docker exec -it $(docker ps -q) /bin/bash' ; sleep infinity
fi

# Copy RPM package to host
mkdir -p /dist/fedora
cp $( find $PKG_BUILD_ROOT/RPMS/ -name *.rpm) /dist/fedora
