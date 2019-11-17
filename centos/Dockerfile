FROM centos:8

# Set the working directory and LD_LIBRARY_PATH
WORKDIR /
ENV LD_LIBRARY_PATH /usr/local/lib

# Install basic build tools
RUN $PACKAGE_MANAGER install -y autoconf automake cmake git gcc-c++ libtool make pkg-config rpmdevtools

# Install libdnet and snort daq library from source
RUN git clone https://github.com/jncornett/libdnet
RUN git clone https://github.com/snort3/libdaq
RUN cd libdnet && ./configure && make install
RUN cd libdaq && autoreconf --install && ./configure && make install

# Install other snort dependencies
RUN $PACKAGE_MANAGER install -y hwloc-devel libpcap-devel luajit-devel openssl-devel pcre-devel zlib-devel

# Download snort latest source and install
RUN git clone git://github.com/snort3/snort3
RUN cd /snort3 && \
    ./configure_cmake.sh --prefix=/snort3/snort3 && \
    cd build && \
    make -j $(nproc) install

# Basic installation check
RUN /snort3/snort3/bin/snort -V

# Make RPM package
RUN mkdir -p /root/rpmbuild/BUILD/usr     && cp -r /snort3/snort3/* /root/rpmbuild/BUILD/usr
RUN mkdir -p /root/rpmbuild/BUILD/usr/lib && cp -r /usr/local/lib/* /root/rpmbuild/BUILD/usr/lib
RUN mkdir -p /root/rpmbuild/SPECS
COPY . /root/rpmbuild/SPECS
RUN rpmbuild -bb /root/rpmbuild/SPECS/snort3.spec

# Copy RPM package to host
ENTRYPOINT cp -r /root/rpmbuild/RPMS/* /dist
