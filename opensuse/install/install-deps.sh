#!/bin/bash

# Exit if any command fails
set -e

zypper install -y autoconf automake cmake gcc-c++ git libtool make pkg-config

# Install libpcap, libdnet and snort daq library from source
cd / && git clone https://github.com/snort3/libdaq
cd libdaq && autoreconf --install && ./configure && make install
