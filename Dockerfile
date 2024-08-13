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
    sudo \
    xvfb \
    colmap \
    && apt-get clean

# Install CMake 3.30.1
RUN wget https://github.com/Kitware/CMake/releases/download/v3.30.1/cmake-3.30.1.tar.gz && \
    tar xfvz cmake-3.30.1.tar.gz && cd cmake-3.30.1 && \
    ./bootstrap && make -j$(nproc) && \
    make install && \
    cd .. && rm -rf cmake-3.30.1 cmake-3.30.1.tar.gz

# Update library cache
RUN ldconfig

# Clone the glomap repository
RUN git clone --recursive https://github.com/valteu/glomap.git /opt/glomap

WORKDIR /opt/glomap

RUN cmake .. -GNinja && ninja && ninja install

# Set up the environment variable to use xvfb
ENV DISPLAY=:99

# Start xvfb in the background
CMD ["sh", "-c", "Xvfb :99 -screen 0 1024x768x24 & bash"]

# Set the entrypoint to bash to allow for an interactive session
ENTRYPOINT ["/bin/bash"]
