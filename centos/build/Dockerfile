ARG OS_VERSION
FROM $OS_VERSION

# Set the working directory
WORKDIR /

# Install basic build tools
RUN dnf install -y autoconf automake bison cmake flex git gcc-c++ gzip libtool make pkg-config wget

# Install other snort dependencies, according with necessary additional repositories
RUN dnf install -y dnf-plugins-core && \
    dnf install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm && \
    dnf config-manager --set-enabled PowerTools
RUN dnf install -y hwloc-devel luajit-devel openssl-devel pcre-devel zlib-devel

# Copy auxiliary script
COPY ./snort-source.sh /

# Set path, where dependencies are installed
ENV LD_LIBRARY_PATH /usr/local/lib

# Download latest snort source and install
RUN /snort-source.sh

# Install RPM build tools
RUN dnf install -y rpm-build rpmdevtools

# Build and copy RPM package to host
# Add --keep option to entrypoint script to keep container open;
# It allows to easily debug using docker exec.
COPY . /
ENTRYPOINT /entrypoint.sh
