# Use an Ubuntu base image
FROM ubuntu:22.04

# Install necessary dependencies
RUN apt-get update && apt-get install -y \
    git \
    vim \
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
    libmetis-dev \
    libboost-program-options-dev \
    libboost-filesystem-dev \
    libboost-graph-dev \
    libboost-system-dev \
    libflann-dev \
    libfreeimage-dev \
    libsqlite3-dev \
    libglew-dev \
    qtbase5-dev \
    libqt5opengl5-dev \
    libcgal-dev \
    libceres-dev \
    software-properties-common \
    && apt-get clean

# Install CMake 3.20 or higher
RUN wget https://github.com/Kitware/CMake/releases/download/v3.27.5/cmake-3.27.5-linux-x86_64.sh && \
    chmod +x cmake-3.27.5-linux-x86_64.sh && \
    ./cmake-3.27.5-linux-x86_64.sh --skip-license --prefix=/usr/local && \
    rm cmake-3.27.5-linux-x86_64.sh

# Update library cache
RUN ldconfig

# Clone the glomap repository
RUN git clone --recursive https://github.com/valteu/glomap.git /opt/glomap

WORKDIR /opt/glomap

# Set the entrypoint to bash to allow for an interactive session
ENTRYPOINT ["/bin/bash"]
