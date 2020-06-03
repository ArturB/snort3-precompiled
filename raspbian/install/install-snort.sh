#!/bin/bash

# Exit if any command fails
set -e

# Install snort
apt-get update && apt-get install -y $DIST_DIR/snort3*$DIST_NAME*.deb
