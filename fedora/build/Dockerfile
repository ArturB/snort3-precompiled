ARG OS_VERSION
FROM $OS_VERSION

# Set the working directory
WORKDIR /

# Install basic build tools
RUN dnf install -y autoconf automake bison cmake flex git gcc-c++ libtool make pkg-config wget

# Install other snort dependencies
RUN dnf install -y hwloc-devel luajit-devel openssl-devel pcre-devel zlib-devel

# Copy auxiliary script
COPY ./snort-source.sh /

# Set path, where dependencies are installed
ENV LD_LIBRARY_PATH /usr/local/lib

# Download latest snort source and install
RUN /snort-source.sh

# Install RPM build tools
RUN dnf install -y rpmdevtools

# Build and copy RPM package to host
# Add --keep option to entrypoint script to keep container open;
# It allows to easily debug using docker exec.
COPY . /
ENTRYPOINT /entrypoint.sh
