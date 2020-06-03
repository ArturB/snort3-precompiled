#!/bin/bash

# Exit if any command fails
set -e

# Install libpcap, libdnet and snort daq library from source
cd / && wget http://www.tcpdump.org/release/libpcap-1.9.1.tar.gz && tar -xvf libpcap-1.9.1.tar.gz
cd libpcap-1.9.1 && ./configure && make install & LIBPCAP_PID=$!
cd / && git clone https://github.com/jncornett/libdnet
cd libdnet && ./configure && make install & LIBDNET_PID=$!
cd / && git clone https://github.com/snort3/libdaq
cd libdaq && autoreconf --install && ./configure && make install & LIBDAQ_PID=$!

wait $LIBPCAP_PID
wait $LIBDNET_PID
wait $LIBDAQ_PID

# Download snort latest source and install
cd / && git clone git://github.com/ArturB/snort3
cd snort3 && \
    ./configure_cmake.sh --prefix=$BUILD_PATH && \
    cd build && \
        make -j $(nproc) install

# Basic installation check
$BUILD_PATH/bin/snort -V
