ARG OS_VERSION
FROM $OS_VERSION

# Set the working directory
WORKDIR /

# Install basic build tools
RUN apt-get update && apt-get install -y autoconf automake bison cmake flex git g++ libtool make pkg-config wget

# Install libpcap, libdnet and snort daq library from source
RUN wget http://www.tcpdump.org/release/libpcap-1.9.1.tar.gz && tar -xvf libpcap-1.9.1.tar.gz
RUN cd libpcap-1.9.1 && ./configure && make install
RUN git clone https://github.com/jncornett/libdnet
RUN cd libdnet && ./configure && make install
RUN git clone https://github.com/snort3/libdaq
RUN cd libdaq && autoreconf --install && ./configure && make install

# Install other snort dependencies
RUN apt-get install -y libhwloc-dev libluajit-5.1-dev libssl-dev libpcre3-dev zlib1g-dev

# Set runtime environment:
#  - path, where libraries compiled from source are installed
ENV LD_LIBRARY_PATH /usr/local/lib

# Download snort latest source and install
RUN git clone git://github.com/snort3/snort3
RUN cd /snort3 && \
    ./configure_cmake.sh --prefix=/snort3/snort3 && \
    cd build && \
    make -j $(nproc) install

# Basic installation check
RUN /snort3/snort3/bin/snort -V

# Set runtime environment:
#  - package build root
ENV PKG_BUILD_ROOT /snort3-0.1-1
# Set runtime environment:
#  - path, where staiic libaries should be installed on target machine
ENV TARGET_LIBRARY_PATH /usr/lib/x86_64-linux-gnu

# Copy files contained in DEB package
RUN mkdir -p $PKG_BUILD_ROOT/usr && \
    cp -r /snort3/snort3/* $PKG_BUILD_ROOT/usr && \
    mkdir -p $PKG_BUILD_ROOT/$TARGET_LIBRARY_PATH && \
    cp -r $LD_LIBRARY_PATH/* $PKG_BUILD_ROOT/$TARGET_LIBRARY_PATH

# Build DEB package
COPY ./control /
RUN mkdir -p $PKG_BUILD_ROOT/DEBIAN && \
    cp /control $PKG_BUILD_ROOT/DEBIAN
RUN dpkg-deb --build /snort3-0.1-1

# Copy DEB package to host
# Add --keep option to entrypoint script to keep container open;
# It allows to easily debug using docker exec.
COPY ./entrypoint.sh /
ENTRYPOINT /entrypoint.sh
