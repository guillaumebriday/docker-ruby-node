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

    image=guillaumebriday/ruby-node:$version

    docker pull ruby:"$version"
    docker build -t "$image" ./"$dockerfile"
    docker push "$image"

    docker rmi ruby:"$version" "$image"
  done
done
