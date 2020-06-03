#!/bin/bash

# Exit if any command fails
set -e

zypper install -y \
    autoconf automake bison cmake flex git gcc-c++ libtool make pkg-config wget \
    hwloc-devel xz-devel luajit-devel openssl-devel pcre-devel zlib-devel \
    rpm-build rpmdevtools
