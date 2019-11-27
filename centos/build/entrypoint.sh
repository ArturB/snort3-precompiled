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

# Copy files containes in RPM package
mkdir -pv $PKG_BUILD_ROOT/BUILD/usr
cp -rv /snort3/snort3/* $PKG_BUILD_ROOT/BUILD/usr
mkdir -pv $PKG_BUILD_ROOT/BUILD/$TARGET_LIBRARY_PATH
cp -rv $LD_LIBRARY_PATH/* $PKG_BUILD_ROOT/BUILD/$TARGET_LIBRARY_PATH
rm -fv $PKG_BUILD_ROOT/BUILD/$TARGET_LIBRARY_PATH/libpcap*
rm -fv $PKG_BUILD_ROOT/BUILD/$TARGET_LIBRARY_PATH/*/libpcap*

# Build RPM package
mkdir -pv $PKG_BUILD_ROOT/SPECS
cp -v /snort3.spec $PKG_BUILD_ROOT/SPECS
rpmbuild -bb $PKG_BUILD_ROOT/SPECS/snort3.spec

# Copy RPM package to host
mkdir -pv $DIST_DIR
cp -v $PKG_BUILD_ROOT/RPMS/*/*.rpm $DIST_DIR
