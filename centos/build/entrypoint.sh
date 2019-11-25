#!/bin/bash

# If specified, keep container open, allowing user to log in with bash
if [[ $1 == "--keep" ]]; then 
echo -e \
'Snort3 docker container started!\
You may now log in into the container with the following command:\
docker exec -it $(docker ps -q) /bin/bash' ; sleep infinity
fi

# Copy RPM package to host
mkdir -p /dist/centos
cp $( find $PKG_BUILD_ROOT/RPMS/ -name *.rpm) /dist/centos
for f in $( ls /dist/centos | grep -v centos )
do 
    mv /dist/opensuse/$f /dist/centos/$(basename $f .rpm)-$CENTOS_VERSION.rpm
done
