#!/bin/bash

set -e -x 

pushd credhub-api-site
  apt-get update
  apt-get install -y nodejs
  bundle install
  bundle exec middleman build --clean
  mv build built-site/
popd
