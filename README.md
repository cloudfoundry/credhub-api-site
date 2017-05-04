### Run locally 
```shell
bundle install
bundle exec middleman server
```

### Build site to publish 
```shell 
bundle exec middleman build --clean
```

### Publish
```shell
cd build/
cf push credhub-api
```
