ARG OS_VERSION
FROM $OS_VERSION

# Set the working directory
WORKDIR /

# Install snort and check it
# Add keep option to entrypoint script to keep container open;
# It allows to easily debug using docker exec.
COPY . /
ENTRYPOINT /entrypoint.sh install
