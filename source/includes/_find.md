# Find Credentials

## Find by Partial Name

> CredHub CLI

```shell
user$ credhub find --name-like 'password'
credentials: 
- name: /password1
  version_created_at: 2017-05-09T21:09:26Z
- name: /test/example/password
  version_created_at: 2017-05-09T21:09:07Z
```

> cURL

```shell
curl "https://example.com/api/v1/data?name-like=password" \
  -X GET \
  -H "authorization: bearer [token]" \
  -H 'content-type: application/json'
```

```json
{
  "credentials": [
    {
      "version_created_at": "2017-05-09T21:09:26Z",
      "name": "/password1"
    },
    {
      "version_created_at": "2017-05-09T21:09:07Z",
      "name": "/test/example/password"
    }
  ]
}
```

This request retrieves a list of stored credential names which contain the search.

### HTTP Request

`GET: https://example.com/api/v1/data`

### Query Parameters

Parameter | Default | Required | Type | Description
--------- | --------- | --------- | --------- | -----------
name-like | none | true | string | Search term to match against stored credential names

## Find by Path

> CredHub CLI

```shell
user$ credhub find --path '/director-name/deployment-name'
credentials:
- name: /director-name/deployment-name/db-password
  version_created_at: 2017-05-09T21:09:26Z
- name: /director-name/deployment-name/user-password
  version_created_at: 2017-05-09T21:09:07Z
- name: /director-name/deployment-name/api-tls
  version_created_at: 2017-05-10T11:13:07Z
```

> cURL

```shell
curl "https://example.com/api/v1/data?path=/director-name/deployment-name" \
  -X GET \
  -H "authorization: bearer [token]" \
  -H 'content-type: application/json'
```

```json
{
  "credentials": [
    {
      "version_created_at": "2017-05-09T21:09:26Z",
      "name": "/director-name/deployment-name/db-password"
    },
    {
      "version_created_at": "2017-05-09T21:09:07Z",
      "name": "/director-name/deployment-name/user-password"
    },
    {
      "version_created_at": "2017-05-10T11:13:07Z",
      "name": "/director-name/deployment-name/api-tls"
    }
  ]
}
```

This request retrieves a list of stored credential names which are within the specified path.

### HTTP Request

`GET: https://example.com/api/v1/data`

### Query Parameters

Parameter | Default | Required | Type | Description
--------- | --------- | --------- | --------- | -----------
path | none | true | string | Path of credentials to return

## Show All Paths

> CredHub CLI

```shell
user$ credhub find --all-paths
paths: 
- path: /
- path: /director-name/
- path: /director-name/deploy1/
- path: /director-name/deploy2/
- path: /director2/
```

> cURL

```shell
curl "https://example.com/api/v1/data?paths=true" \
  -X GET \
  -H "authorization: bearer [token]" \
  -H 'content-type: application/json'
```

```json
{
  "paths": [
    {
      "path": "/"
    },
    {
      "path": "/director-name/"
    },
    {
      "path": "/director-name/deploy1/"
    },
    {
      "path": "/director-name/deploy2/"
    },
    {
      "path": "/director2/"
    }
  ]
}
```

This request retrieves a list of all paths which contain credentials.

### HTTP Request

`GET: https://example.com/api/v1/data`

### Query Parameters

Parameter | Default | Required | Type | Description
--------- | --------- | --------- | --------- | -----------
paths | none | true | boolean | Will return list of all paths if true
