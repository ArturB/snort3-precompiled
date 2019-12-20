#!/bin/bash

# Exit if any command fails
set -e

# Install snort
dnf install -y $DIST_DIR/snort3*$DIST_NAME*.rpm
