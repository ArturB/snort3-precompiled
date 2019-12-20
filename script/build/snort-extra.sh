#!/bin/bash

# Exit if any command fails
set -e

# Download snort_extra repo and install
cd / && git clone https://github.com/snort3/snort3_extra
cd /snort3_extra && \
    ./configure_cmake.sh --prefix=$BUILD_PATH && \
    cd build && \
        make -j $(nproc) install
