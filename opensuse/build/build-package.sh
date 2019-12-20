#!/bin/bash

# Exit if any command fails
set -e

# Copy files containes in RPM package

# /etc/snort
mkdir -pv $PKG_BUILD_ROOT/BUILD/etc/snort
cp -rv $BUILD_PATH/etc/snort/* $PKG_BUILD_ROOT/BUILD/etc/snort

# /usr/bin
mkdir -pv $PKG_BUILD_ROOT/BUILD/usr/bin
cp -rv $BUILD_PATH/bin/* $PKG_BUILD_ROOT/BUILD/usr/bin

# /usr/lib64
mkdir -pv $PKG_BUILD_ROOT/BUILD/usr/lib64
cp -rv $BUILD_PATH/lib64/* $PKG_BUILD_ROOT/BUILD/usr/lib64

# /usr/include/snort
mkdir -pv $PKG_BUILD_ROOT/BUILD/usr/include/snort
cp -rv $BUILD_PATH/include/snort $PKG_BUILD_ROOT/BUILD/usr/include/snort

# /usr/share/doc/snort
mkdir -pv $PKG_BUILD_ROOT/BUILD/usr/share/doc/snort
cp -rv $BUILD_PATH/share/doc/snort $PKG_BUILD_ROOT/BUILD/usr/share/doc/snort

# LD_LIBRARY_PATH (source dependencies)
mkdir -pv $PKG_BUILD_ROOT/BUILD/$TARGET_LIBRARY_PATH
cp -rv $LD_LIBRARY_PATH/* $PKG_BUILD_ROOT/BUILD/$TARGET_LIBRARY_PATH
rm -fv $PKG_BUILD_ROOT/BUILD/$TARGET_LIBRARY_PATH/libpcap*

# Build RPM package
mkdir -pv $PKG_BUILD_ROOT/SPECS
cp -v /snort3.spec $PKG_BUILD_ROOT/SPECS
rpmbuild -bb $PKG_BUILD_ROOT/SPECS/snort3.spec
