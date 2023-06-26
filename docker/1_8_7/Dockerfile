FROM ubuntu:18.04

# Prerequisites
RUN \
  apt-get update && \
  apt-get install -y --no-install-recommends  \
    autoconf bison build-essential bzip2 ca-certificates curl \
    docker-compose g++ git gstreamer1.0-plugins-base gstreamer1.0-tools \
    gstreamer1.0-x libbz2-dev libdb-dev libffi-dev libffi-dev libgdbm-dev \
    libgmp-dev libjson-perl libncurses-dev \
    libreadline-dev libssl1.0-dev libyaml-dev zlib1g-dev

COPY gemrc /etc/gemrc
COPY bashrc /root/.bashrc
COPY tool-versions /root/.tool-versions

# Install asdf
RUN git clone https://github.com/asdf-vm/asdf.git ~/.asdf

RUN bash -c ' \
  . /root/.bashrc && \
  asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git && \
  asdf install ruby 1.8.7-p374 --verbose'

RUN bash -c ' \
  . /root/.bashrc && \
  gem install -v 1.1.2 json'

CMD [ "bash" ]
