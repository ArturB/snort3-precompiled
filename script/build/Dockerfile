ARG OS_VERSION

FROM $OS_VERSION

# Set the working directory
WORKDIR /

# Install necessary dependencies
COPY install-deps.sh /
RUN /install-deps.sh

# Set build path and dependencies path
ARG _BUILD_PATH
ARG _LD_LIBRARY_PATH
ENV BUILD_PATH ${_BUILD_PATH}
ENV LD_LIBRARY_PATH ${_LD_LIBRARY_PATH}

# Download latest snort source and install
COPY .snort.sh /
RUN /.snort.sh

# Set pkg-config path
ARG _PKG_CONFIG_PATH
ENV PKG_CONFIG_PATH ${_PKG_CONFIG_PATH}

# Download snort3_extra (plugins) and install
COPY .snort-extra.sh / 
RUN /.snort-extra.sh

# Set package root build path and target paths
ARG _PKG_BUILD_ROOT
ARG _TARGET_LIBRARY_PATH
ENV PKG_BUILD_ROOT ${_PKG_BUILD_ROOT}
ENV TARGET_LIBRARY_PATH ${_TARGET_LIBRARY_PATH}

# Build snort3 RPM package
ARG _PKG_FILENAME
COPY build-package.sh /
COPY ${_PKG_FILENAME} /
RUN /build-package.sh

# Set package name and path
ARG _DIST_NAME
ARG _DIST_DIR
ENV DIST_NAME ${_DIST_NAME}
ENV DIST_DIR ${_DIST_DIR}

# Build and/or copy RPM package to host
# Add keep option to entrypoint script to keep container open;
# It allows to easily debug using docker exec.
COPY . /
ENTRYPOINT /.entrypoint.sh copy
