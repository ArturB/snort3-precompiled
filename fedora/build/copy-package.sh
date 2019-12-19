#!/bin/bash

# Exit if any command fails
set -e

# Copy RPM package to host
mkdir -pv $DIST_DIR
cp -v $PKG_BUILD_ROOT/RPMS/*/*.rpm $DIST_DIR
