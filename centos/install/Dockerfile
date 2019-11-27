ARG OS_VERSION
FROM $OS_VERSION

# Set the working directory
WORKDIR /

# Install PowertTools repository
RUN dnf install -y dnf-plugins-core && \
    dnf install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm && \
    dnf config-manager --set-enabled PowerTools

# Install snort and check it
# Add --keep option to entrypoint script to keep container open;
# It allows to easily debug using docker exec.
COPY ./entrypoint.sh /
ENTRYPOINT ./entrypoint.sh
