#!/bin/bash
if [ `docker images -q compilerbook | wc -l` -eq 1 ]; then 
  echo Prepararing compilerbook docker image
  docker build -t compilerbook https://www.sigbus.info/compilerbook/Dockerfile
fi

if [ -d `pwd`/$1 ]; then
  WORK_DIR=`pwd`/$1
else
  if [ -d `pwd`/step$1 ]; then
    WORK_DIR=`pwd`/step$1
  else
    echo "usage: $0 [step number]"
    exit 1
  fi
fi

echo Starting run_docker on $WORK_DIR
docker run --rm -v ${WORK_DIR}:/kcc -w /kcc compilerbook make test
