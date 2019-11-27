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

# Copy files contained in DEB package
mkdir -p $PKG_BUILD_ROOT/usr
cp -r /snort3/snort3/* $PKG_BUILD_ROOT/usr
mkdir -p $PKG_BUILD_ROOT/$TARGET_LIBRARY_PATH
cp -r $LD_LIBRARY_PATH/* $PKG_BUILD_ROOT/$TARGET_LIBRARY_PATH

# Build DEB package
mkdir -p $PKG_BUILD_ROOT/DEBIAN
cp /control $PKG_BUILD_ROOT/DEBIAN
dpkg-deb --build /snort3-0.1-1

# Copy DEB package to host
mkdir -pv $DIST_DIR
cp -v /*.deb $DIST_DIR
for f in $( ls $DIST_DIR | grep -v raspbian )
do 
    mv -v $DIST_DIR/$f $DIST_DIR/$(basename $f .deb)-$DIST_NAME.deb
done
