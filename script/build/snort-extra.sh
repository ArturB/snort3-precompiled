#!/bin/bash

# Exit if any command fails
set -e

# Download snort_extra repo and install
cd / && git clone https://github.com/snort3/snort3_extra
cd /snort3_extra && \
    ./configure_cmake.sh --prefix=$BUILD_PATH && \
    cd build && \
        make -j $(nproc) install

# Basic installation check
$BUILD_PATH/bin/snort \
    -c $BUILD_PATH/etc/snort/snort.lua \
    --plugin-path $BUILD_PATH/lib64/snort_extra \
