#!/bin/sh

docker run -v $(pwd):/root/back-in-my-day -it ruby_1_8_7 bash -c "\
  source ~/.bashrc && \
  cd ~/back-in-my-day && \
  ruby -rubygems demo.rb $1" | fromdos
