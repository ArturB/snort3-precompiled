#!/bin/bash

# Exit if any command fails
set -e

# Copy DEB package to host
mkdir -pv $DIST_DIR
ls /
cp -v /*generic*.tar.gz $DIST_DIR
