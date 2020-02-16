#! /bin/bash

for folder in step6 step7
do
  if [ $1=='docker' ]; then
    sh run_docker.sh $folder
  else
    cd $folder
    make test
    cd ..
  fi
done

