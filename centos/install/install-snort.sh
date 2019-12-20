#!/bin/bash

# Exit if any command fails
set -e

# Install snort
dnf install -y dnf-plugins-core https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
dnf config-manager --set-enabled PowerTools
dnf install -y $DIST_DIR/snort3*$DIST_NAME*.rpm
