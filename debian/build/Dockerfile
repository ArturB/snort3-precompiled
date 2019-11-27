ARG OS_VERSION
FROM $OS_VERSION

# Set the working directory
WORKDIR /

# Install basic build tools
RUN apt-get update && apt-get install -y autoconf automake bison cmake flex git g++ libtool make pkg-config wget

# Install other snort dependencies
RUN apt-get install -y libhwloc-dev libluajit-5.1-dev libssl-dev libpcre3-dev zlib1g-dev

# Copy auxiliary script
COPY ./snort-source.sh /

# Set path, where dependencies are installed
ENV LD_LIBRARY_PATH /usr/local/lib

# Download latest snort source and install
RUN /snort-source.sh

# Build and copy DEB package to host
# Add --keep option to entrypoint script to keep container open;
# It allows to easily debug using docker exec.
COPY . /
ENTRYPOINT /entrypoint.sh
