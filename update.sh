#!/usr/bin/env bash

variants=(
  ""
  slim
  alpine
)

for tag in */; do
  tag=${tag%*/}
  version=$tag
  dockerfile=$tag

  for variant in "${variants[@]}"; do
    if [ "$variant" != "" ]; then
      version=$tag-$variant
      dockerfile=$tag/$variant
    fi

    docker pull ruby:$version
    docker build -t guillaumebriday/ruby-node:$version ./$dockerfile
    docker push guillaumebriday/ruby-node:$version
  done
done
