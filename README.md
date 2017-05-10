### Editing Content

All user-provided content in the 'source' folder. The primary page is `source/index.html.md`, which pulls in sections of content from files in the `source/includes/` folder.  

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
