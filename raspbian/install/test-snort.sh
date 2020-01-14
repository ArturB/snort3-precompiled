#!/bin/bash

# Exit if any command fails
set -e

# Basic snort installation check
snort --daq-dir=$TARGET_LIBRARY_PATH/daq --daq-list
snort --daq-dir=$TARGET_LIBRARY_PATH/daq \
      -c /etc/snort/snort.lua \
      --plugin-path /$TARGET_LIBRARY_PATH/snort_extra
snort -V
sleep 2

# Snort plugins check
cd / && git clone https://github.com/snort3/snort3_extra
cd /snort3_extra && \
    ./configure_cmake.sh && \
    cd build && \
        make -j $(nproc) install
