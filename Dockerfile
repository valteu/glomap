# Use an Ubuntu base image
FROM ubuntu:22.04

# Install necessary dependencies
RUN apt-get update && apt-get install -y \
    git \
    apt-utils \
    ninja-build \
    build-essential \
    wget \
    libeigen3-dev \
    libblas-dev \
    libsuitesparse-dev \
    libgoogle-glog-dev \
    libgflags-dev \
    libatlas-base-dev \
    cmake \
    libmetis-dev \
    libabsl-dev \
    && rm -rf /var/lib/apt/lists/*

# Install CMake 3.28 or newer
RUN wget https://github.com/Kitware/CMake/releases/download/v3.28.0/cmake-3.28.0-linux-x86_64.sh \
    && chmod +x cmake-3.28.0-linux-x86_64.sh \
    && ./cmake-3.28.0-linux-x86_64.sh --skip-license --prefix=/usr/local \
    && rm cmake-3.28.0-linux-x86_64.sh

# Clone and build abseil-cpp with position independent code enabled
RUN git clone https://github.com/abseil/abseil-cpp.git /tmp/abseil-cpp \
    && cd /tmp/abseil-cpp \
    && mkdir build \
    && cd build \
    && cmake .. -DCMAKE_POSITION_INDEPENDENT_CODE=TRUE -DBUILD_TESTING=OFF -DCMAKE_INSTALL_PREFIX=/usr/local \
    && make -j$(nproc) \
    && make install \
    && rm -rf /tmp/abseil-cpp

# Install Ceres Solver from source with the abseil-cpp dependency
RUN git clone https://ceres-solver.googlesource.com/ceres-solver /tmp/ceres-solver \
    && cd /tmp/ceres-solver \
    && git submodule update --init --recursive \
    && mkdir build \
    && cd build \
    && cmake .. -DBUILD_TESTING=OFF -DBUILD_EXAMPLES=OFF -DCMAKE_PREFIX_PATH=/usr/local -DUSE_ABSEIL=ON \
    && make -j$(nproc) \
    && make install \
    && rm -rf /tmp/ceres-solver

# Clone the glomap repository
RUN git clone --recursive https://github.com/valteu/glomap.git /opt/glomap

# Set up the build environment
WORKDIR /opt/glomap

# Set the entrypoint to bash to allow for an interactive session
ENTRYPOINT ["/bin/bash"]
