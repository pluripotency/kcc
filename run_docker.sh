#!/bin/bash
if [ `docker images -q compilerbook | wc -l` -ne 1 ]; then 
  echo Prepararing compilerbook docker image
  docker build -t compilerbook https://www.sigbus.info/compilerbook/Dockerfile
fi

if [ -d `pwd`/$1 ]; then
  STEP_DIR=$1
else
  if [ -d `pwd`/step$1 ]; then
    STEP_DIR=step$1
  else
    echo "usage: $0 [step number]"
    exit 1
  fi
fi

echo testing $STEP_DIR by docker

docker run --rm -v `pwd`/${STEP_DIR}:/kcc -w /kcc compilerbook make test
