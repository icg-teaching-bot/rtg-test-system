FROM nvidia/cudagl:10.1-devel
LABEL maintainer "Thomas Neff <thomas.neff@icg.tugraz.at>"

RUN apt-get update && apt-get install --yes --no-install-recommends software-properties-common
RUN add-apt-repository ppa:ubuntu-toolchain-r/test && apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    gcc-8 g++-8 \
    cmake \
    ninja-build \
    xorg-dev \
    libgl1-mesa-dev \
    xvfb \
    imagemagick \
    ghostscript \
    python3-numpy \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

ENV DISPLAY=:0
ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES all
