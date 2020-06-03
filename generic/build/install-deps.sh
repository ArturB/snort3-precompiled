#!/bin/bash

# Exit if any command fails
set -e

apt-get update && apt-get install -y \
    autoconf automake bison cmake flex git g++ libtool make pkg-config wget \
    libhwloc-dev libluajit-5.1-dev libssl-dev libpcre3-dev zlib1g-dev
