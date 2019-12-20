#!/bin/bash

# Exit if any command fails
set -e

# Install snort
zypper --non-interactive install --allow-unsigned-rpm -y $DIST_DIR/snort3*$DIST_NAME*.rpm
