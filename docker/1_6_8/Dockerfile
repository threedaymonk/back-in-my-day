FROM 32bit/ubuntu:16.04

# Prerequisites
RUN \
  apt-get update && \
  apt-get install -y --no-install-recommends  \
    autoconf bison build-essential bzip2 ca-certificates curl \
    docker-compose g++ git gstreamer1.0-plugins-base gstreamer1.0-tools \
    gstreamer1.0-x libbz2-dev libdb-dev libffi-dev libffi-dev libgdbm-dev \
    libgmp-dev libjson-perl libncurses-dev \
    libreadline-dev libyaml-dev zlib1g-dev

RUN git clone --branch v1_6_8 --depth 1 https://github.com/tmm1/matzruby.git ~/ruby

COPY ruby.patch /root/ruby.patch

RUN \
  cd ~/ruby && \
  patch -p1 < ~/ruby.patch && \
  autoconf && \
  ./configure && \
  make
