#!/bin/bash

# Exit if any command fails
set -e

dnf install -y autoconf automake bison cmake flex git gcc-c++ gzip libtool make pkg-config wget \
               dnf-plugins-core https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
dnf config-manager --set-enabled PowerTools
dnf install -y hwloc-devel luajit-devel openssl-devel pcre-devel zlib-devel \
               rpm-build rpmdevtools
