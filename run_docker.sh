#!/bin/bash
#docker build -t compilerbook https://www.sigbus.info/compilerbook/Dockerfile
docker run --rm -v $HOME/Projects/kcc:/kcc -w /kcc compilerbook make test
