#!/bin/bash

# Exit if any command fails
set -e

# Install snort
dnf install -y $DIST_DIR/snort3*$DIST_NAME*.rpm

# Basic installation check
snort --daq-dir=$TARGET_LIBRARY_PATH/daq --daq-list
snort --daq-dir=$TARGET_LIBRARY_PATH/daq \
      -c /etc/snort/snort.lua \
      --plugin-path /lib64/snort_extra
snort -V
sleep 2
