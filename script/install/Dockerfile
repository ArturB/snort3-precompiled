ARG OS_VERSION

FROM $OS_VERSION

# Set the working directory
WORKDIR /

# Set distribution name (used to install appropriate package) 
# package path and library path
ARG _DIST_NAME
ARG _DIST_DIR
ARG _TARGET_LIBRARY_PATH
ENV DIST_NAME ${_DIST_NAME}
ENV DIST_DIR ${_DIST_DIR}
ENV TARGET_LIBRARY_PATH ${_TARGET_LIBRARY_PATH}

# Install snort and check it
# Add keep option to entrypoint script to keep container open;
# It allows to easily debug using docker exec.
COPY . /
ENTRYPOINT /.entrypoint.sh install
