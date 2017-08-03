#!/usr/bin/env bash

TAG="$1"

if [[ -z "$TAG" ]]; then
  echo "tag must be provided"
  exit 1
fi

cd /tmp
mkdir bbuddy

function fork {
  repo="$1"
  git clone git@github.com:nerds-odd-e/"$repo".git
  cd "$repo"
  hub create bbuddies/"$repo-$TAG".git
  git remote add $TAG git@github.com:bbuddies/"$repo-$TAG".git
  git push $TAG master
  cd ..
  rm -rf "$repo"
}

fork bbuddy
#fork bbuddy-api
#fork bbuddy-android
#fork bbuddy-ios
#fork bbuddy-react
#fork bbuddy-angular
#fork bbuddy-acceptance-test
