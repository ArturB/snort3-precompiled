ARG OS_VERSION
FROM $OS_VERSION

# Set the working directory
WORKDIR /

# Install necessary dependencies
COPY install-deps.sh /
RUN /install-deps.sh

# Set build path and path, where dependencies are installed
ENV BUILD_PATH /snort3/snort3
ENV LD_LIBRARY_PATH /usr/local/lib

# Download latest snort source and install
COPY snort.sh /
RUN /snort.sh

# Set pkgconfig path
ENV PKG_CONFIG_PATH ${BUILD_PATH}/lib64/pkgconfig

# Download snort3_extra (plugins) and install
COPY snort-extra.sh / 
RUN /snort-extra.sh

# Set rpmbuild root path
ENV PKG_BUILD_ROOT /root/rpmbuild
ENV TARGET_LIBRARY_PATH /usr/lib64

# Build snort3 RPM package
COPY build-package.sh /
COPY copy-package.sh /
COPY snort3.spec /
RUN /build-package.sh

# Build and copy RPM package to host
# Add --keep option to entrypoint script to keep container open;
# It allows to easily debug using docker exec.
COPY entrypoint.sh /
ENTRYPOINT /entrypoint.sh copy
