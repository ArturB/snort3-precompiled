#!/bin/bash

# Exit if any command fails
set -e

# Copy files containes in DEB package

# /etc/snort
mkdir -pv $PKG_BUILD_ROOT/etc/snort
cp -rv $BUILD_PATH/etc/snort/* $PKG_BUILD_ROOT/etc/snort

# /usr/bin
mkdir -pv $PKG_BUILD_ROOT/usr/bin
cp -rv $BUILD_PATH/bin/* $PKG_BUILD_ROOT/usr/bin

# /usr/lib
mkdir -pv $PKG_BUILD_ROOT/usr/lib
cp -rv $BUILD_PATH/lib/* $PKG_BUILD_ROOT/usr/lib

# /usr/include/snort
mkdir -pv $PKG_BUILD_ROOT/usr/include/snort
cp -rv $BUILD_PATH/include/snort $PKG_BUILD_ROOT/usr/include/snort

# /usr/share/doc/snort
mkdir -pv $PKG_BUILD_ROOT/usr/share/doc/snort
cp -rv $BUILD_PATH/share/doc/snort $PKG_BUILD_ROOT/usr/share/doc/snort

# LD_LIBRARY_PATH (source dependencies)
mkdir -pv $PKG_BUILD_ROOT/$TARGET_LIBRARY_PATH
cp -rv $LD_LIBRARY_PATH/* $PKG_BUILD_ROOT/$TARGET_LIBRARY_PATH
rm -fv $PKG_BUILD_ROOT/BUILD/$TARGET_LIBRARY_PATH/libpcap*

# Build DEB package
mkdir -p $PKG_BUILD_ROOT/DEBIAN
cp /control $PKG_BUILD_ROOT/DEBIAN
dpkg-deb --build /snort3-0.1-1
