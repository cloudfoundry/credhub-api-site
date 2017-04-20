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
cf push credhub-api
```
