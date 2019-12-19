#!/bin/bash

# Exit if any command fails
set -e

dnf install -y \
    autoconf automake bison cmake flex git gcc-c++ libtool make pkg-config wget \
    hwloc-devel luajit-devel openssl-devel pcre-devel zlib-devel \
    rpmdevtools
