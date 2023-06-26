#!/bin/sh

docker run --platform i386 -v $(pwd):/root/back-in-my-day -it ruby_1_6_8 bash -c "\
  cd ~/back-in-my-day && \
  ~/ruby/ruby -I ~/ruby/lib demo.rb $1" | fromdos
