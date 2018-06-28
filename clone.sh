#!/usr/bin/env bash

TAG="$1"

if [[ -z "$TAG" ]]; then
  echo "tag must be provided"
  exit 1
fi

mkdir "$TAG"
cd "$TAG"

function clone {
  repo="$1"
  echo "Clone $repo-$TAG"
  git clone git@github.com:bbuddies/"$repo-$TAG".git $repo
}

clone bbuddy
clone bbuddy-java-api
clone bbuddy-android
clone bbuddy-ios
clone bbuddy-react
clone bbuddy-angular
clone bbuddy-acceptance-test
