#!/usr/bin/env bash

TAG="$1"

if [[ -z "$TAG" ]]; then
  echo "tag must be provided"
  exit 1
fi

WORK_DIR=`mktemp -d`
cd "$WORK_DIR"

function fork {
  repo="$1"
  git clone git@github.com:nerds-odd-e/"$repo".git
  cd "$repo"
  hub create bbuddies/"$repo-$TAG".git
  git remote add $TAG git@github.com:bbuddies/"$repo-$TAG".git
  git push $TAG master
  cd ..
}

fork bbuddy
fork bbuddy-api
fork bbuddy-android
fork bbuddy-ios
fork bbuddy-react
fork bbuddy-angular
fork bbuddy-acceptance-test

rm -rf "$WORK_DIR"
