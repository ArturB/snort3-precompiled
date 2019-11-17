ARG OS_VERSION
FROM $OS_VERSION

# Set the working directory
WORKDIR /

# Copy the RPM package from dist directory, install snort and check it
# Add --keep option to entrypoint script to keep container open;
# It allows to easily debug using docker exec.
COPY ./entrypoint.sh /
ENTRYPOINT ./entrypoint.sh
