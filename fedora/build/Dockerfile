ARG OS_VERSION
FROM $OS_VERSION

# Set the working directory and environment variables
WORKDIR /
ENV LD_LIBRARY_PATH /usr/local/lib
ENV PKG_BUILD_ROOT /root/rpmbuild

# Install basic build tools
RUN dnf install -y autoconf automake cmake git gcc-c++ libtool make pkg-config rpmdevtools

# Install libdnet and snort daq library from source
RUN git clone https://github.com/jncornett/libdnet
RUN git clone https://github.com/snort3/libdaq
RUN cd libdnet && ./configure && make install
RUN cd libdaq && autoreconf --install && ./configure && make install

# Install other snort dependencies
RUN dnf install -y hwloc-devel libpcap-devel luajit-devel openssl-devel pcre-devel zlib-devel

# Download snort latest source and install
RUN git clone git://github.com/snort3/snort3
RUN cd /snort3 && \
    ./configure_cmake.sh --prefix=/snort3/snort3 && \
    cd build && \
    make -j $(nproc) install

# Basic installation check
RUN /snort3/snort3/bin/snort -V

# Make RPM package
COPY ./snort3.spec /
RUN mkdir -p $PKG_BUILD_ROOT/BUILD/usr     && cp -r /snort3/snort3/* $PKG_BUILD_ROOT/BUILD/usr
RUN mkdir -p $PKG_BUILD_ROOT/BUILD/usr/lib && cp -r /usr/local/lib/* $PKG_BUILD_ROOT/BUILD/usr/lib64
RUN mkdir -p $PKG_BUILD_ROOT/SPECS         && cp    /snort3.spec     $PKG_BUILD_ROOT/SPECS
RUN rpmbuild -bb $PKG_BUILD_ROOT/SPECS/snort3.spec

# Copy RPM package to host
# Add --keep option to entrypoint script to keep container open;
# It allows to easily debug using docker exec.
COPY ./entrypoint.sh /
ENTRYPOINT /entrypoint.sh
