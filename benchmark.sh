#!/bin/sh

for tag in $(git tag | grep ^v); do
  git checkout $tag >/dev/null 2>&1
  echo $tag
  cat .tool-versions
  ./run.sh benchmark
  echo
  git checkout - >/dev/null 2>&1
done
