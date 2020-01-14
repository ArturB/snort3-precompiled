#!/bin/bash

# Exit if any command fails
set -e

# Copy RPM package to host
mkdir -pv $DIST_DIR
cp -v $PKG_BUILD_ROOT/RPMS/*/*.rpm $DIST_DIR
for f in $( ls $DIST_DIR | grep -v leap )
do 
    mv -v $DIST_DIR/$f $DIST_DIR/$(basename $f .rpm)-$DIST_NAME.rpm
done
