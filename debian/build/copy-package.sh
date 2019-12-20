#!/bin/bash

# Exit if any command fails
set -e

# Copy DEB package to host
mkdir -pv $DIST_DIR
cp -v /*.deb $DIST_DIR
for f in $( ls $DIST_DIR | grep -v debian )
do 
    mv -v $DIST_DIR/$f $DIST_DIR/$(basename $f .deb)-$DIST_NAME.deb
done
