ARG OS_VERSION
FROM $OS_VERSION

# Set the working directory and LD_LIBRARY_PATH
WORKDIR /
ENV LD_LIBRARY_PATH /usr/local/lib

# Install basic build tools
RUN apt-get update && apt-get install -y autoconf automake cmake git g++ libtool pkg-config

# Install libdnet and snort daq library from source
RUN git clone https://github.com/jncornett/libdnet
RUN git clone https://github.com/snort3/libdaq
RUN cd libdnet && ./configure && make install
RUN cd libdaq && autoreconf --install && ./configure && make install

# Install other snort dependencies
RUN apt-get install -y libhwloc-dev libpcap-dev libluajit-5.1-dev libssl-dev libpcre3-dev zlib1g-dev

# Download snort latest source and install
RUN git clone git://github.com/snort3/snort3
RUN cd /snort3 && \
    ./configure_cmake.sh --prefix=/snort3/snort3 && \
    cd build && \
    make -j $(nproc) install

# Basic installation check
RUN /snort3/snort3/bin/snort -V

# Make DEB package
# TODO
