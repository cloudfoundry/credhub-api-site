#!/bin/bash

set -e -x 

pushd credhub-api-site
  apt-get update
  apt-get install -y nodejs
  bundle install
  bundle exec middleman build --clean
popd

cp -R credhub-api-site/ built-site/
