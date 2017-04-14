---
title: CredHub API

language_tabs:
  - shell

toc_footers:
  - <a href='https://github.com/cloudfoundry-incubator/credhub'>CredHub Source</a>

includes:
  - errors

search: true
---

# Introduction

TBD

# Authentication

TBD

# Get Credentials

## Get by ID

> CredHub CLI

```shell
[not supported]
```

> cURL

```shell
curl "https://example.com/api/v1/data/67fc3def-bbfb-4953-83f8-4ab0682ad674" \
  -X GET \
  -H "authorization: bearer [token]" \
  -H 'content-type: application/json'
```

```json
{
  "id": "67fc3def-bbfb-4953-83f8-4ab0682ad674",
  "name": "/example-password",
  "type": "password",
  "value": "3t6Y2OFP0jQIcLnki1h7p3NtSfDx4l9bamr1ja6R",
  "version_created_at": "2017-01-01T04:07:18Z"
}
```

This endpoint retrieves a credential by ID.

### HTTP Request

`GET: https://example.com/api/v1/data/[Credential-ID]`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
none |  | 

## Get by Name

> CredHub CLI

```shell
user$ credhub get --name '/example-password'
type: password
name: /example-password
value: 3t6Y2OFP0jQIcLnki1h7p3NtSfDx4l9bamr1ja6R
updated: 2017-01-01T04:07:18Z
```

> cURL

```shell
curl "https://example.com/api/v1/data?name=/example-password" \
  -X GET \
  -H "authorization: bearer [token]" \
  -H 'content-type: application/json'
```

```json
{
  "data": [
    {
      "id": "2993f622-cb1e-4e00-a267-4b23c273bf3d",
      "name": "/example-password",
      "type": "password",
      "value": "6mRPZB3bAfb8lRpacnXsHfDhlPqFcjH2h9YDvLpL",
      "version_created_at": "2017-01-05T01:01:01Z"
    },
    {
      "id": "67fc3def-bbfb-4953-83f8-4ab0682ad674",
      "name": "/example-password",
      "type": "password",
      "value": "3t6Y2OFP0jQIcLnki1h7p3NtSfDx4l9bamr1ja6R",
      "version_created_at": "2017-01-01T04:07:18Z"
    }
  ]
}
```

This endpoint returns a credential by name. 

### HTTP Request

`GET: https://example.com/api/v1/data`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
name | none | Name of credential to retrieve 
current | false | Return only latest credential version 

## Type: Value

> CredHub CLI

```shell
user$ credhub get --name '/example-value'
type: value
name: /example-value
value: sample
updated: 2017-01-01T04:07:18Z
```

> cURL

```shell
curl "https://example.com/api/v1/data?name=/example-value" \
  -X GET \
  -H "authorization: bearer [token]" \
  -H 'content-type: application/json'
```

```json
{
  "data": [
    {
      "id": "67fc3def-bbfb-4953-83f8-4ab0682ad675",
      "name": "/example-value",
      "type": "value",
      "value": "sample",
      "version_created_at": "2017-01-01T04:07:18Z"
    }
  ]
}
```

This endpoint returns a credential by name. 

### HTTP Request

`GET: https://example.com/api/v1/data`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
name | none | Name of credential to retrieve 
current | false | Return only latest credential version 

## Type: JSON

> CredHub CLI

```shell
user$ credhub get --name '/example-json'
type: json
name: /example-json
value: 
  key: 123
  key_list: 
  - val1
  - val2
  is_true: true
updated: 2017-01-01T04:07:18Z
```

> cURL

```shell
curl "https://example.com/api/v1/data?name=/example-json" \
  -X GET \
  -H "authorization: bearer [token]" \
  -H 'content-type: application/json'
```

```json
{
  "data": [
    {
      "id": "67fc3def-bbfb-4953-83f8-4ab0682ad675",
      "name": "/example-json",
      "type": "json",
      "value": {
        "key": 123,
        "key_list": [
          "val1",
          "val2"
        ],
        "is_true": true
      },
      "version_created_at": "2017-01-01T04:07:18Z"
    }
  ]
}
```

This endpoint returns a credential by name. 

### HTTP Request

`GET: https://example.com/api/v1/data`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
name | none | Name of credential to retrieve 
current | false | Return only latest credential version 

## Type: Password

> CredHub CLI

```shell
user$ credhub get --name '/example-password'
type: password
name: /example-password
value: 3t6Y2OFP0jQIcLnki1h7p3NtSfDx4l9bamr1ja6R
updated: 2017-01-01T04:07:18Z
```

> cURL

```shell
curl "https://example.com/api/v1/data?name=/example-password" \
  -X GET \
  -H "authorization: bearer [token]" \
  -H 'content-type: application/json'
```

```json
{
  "data": [
    {
      "id": "67fc3def-bbfb-4953-83f8-4ab0682ad675",
      "name": "/example-password",
      "type": "password",
      "value": "6mRPZB3bAfb8lRpacnXsHfDhlPqFcjH2h9YDvLpL",
      "version_created_at": "2017-01-05T01:01:01Z"
    }
  ]
}
```

This endpoint returns a credential by name. 

### HTTP Request

`GET: https://example.com/api/v1/data`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
name | none | Name of credential to retrieve 
current | false | Return only latest credential version 

## Type: User

> CredHub CLI

```shell
user$ credhub get --name '/example-user'
type: user
name: /example-user
value: 
  username: FQnwWoxgSrDuqDLmeLpU
  password: 6mRPZB3bAfb8lRpacnXsHfDhlPqFcjH2h9YDvLpL
updated: 2017-01-01T04:07:18Z
```

> cURL

```shell
curl "https://example.com/api/v1/data?name=/example-user" \
  -X GET \
  -H "authorization: bearer [token]" \
  -H 'content-type: application/json'
```

```json
{
  "data": [
    {
      "id": "67fc3def-bbfb-4953-83f8-4ab0682ad675",
      "name": "/example-user",
      "type": "user",
      "value": {
        "username": "FQnwWoxgSrDuqDLmeLpU",
        "password": "6mRPZB3bAfb8lRpacnXsHfDhlPqFcjH2h9YDvLpL",
        "password_hash": "$6$uu8ybZiNiPRu$6AYClxVqMXA3LAIdDAnEuWLUlWGlm0RRJI2wdHd8R9hKkKtiYupyKBjdRBI1ZhsyHwYetCpySew9ZXXLf.Mih0"
      },
      "version_created_at": "2017-01-05T01:01:01Z"
    }
  ]
}
```

This endpoint returns a credential by name. 

### HTTP Request

`GET: https://example.com/api/v1/data`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
name | none | Name of credential to retrieve 
current | false | Return only latest credential version 


## Type: Certificate

> CredHub CLI

```shell
user$ credhub get --name '/example-certificate'
type: certificate
name: /example-certificate
value: 
  root: |
    -----BEGIN CERTIFICATE-----
    ...
    -----END CERTIFICATE-----
  certificate: |
    -----BEGIN CERTIFICATE-----
    ...
    -----END CERTIFICATE-----
  private_key: |
    -----BEGIN RSA PRIVATE KEY-----
    ...
    -----END RSA PRIVATE KEY-----
updated: 2017-01-01T04:07:18Z
```

> cURL

```shell
curl "https://example.com/api/v1/data?name=/example-certificate" \
  -X GET \
  -H "authorization: bearer [token]" \
  -H 'content-type: application/json'
```

```json
{
  "data": [
    {
      "id": "67fc3def-bbfb-4953-83f8-4ab0682ad676",
      "name": "/example-certificate",
      "type": "certificate",
      "value": {
        "ca": "-----BEGIN CERTIFICATE-----\n...\n-----END CERTIFICATE-----",
        "certificate": "-----BEGIN CERTIFICATE-----\n...\n-----END CERTIFICATE-----",
        "private_key": "-----BEGIN RSA PRIVATE KEY-----\n...\n-----END RSA PRIVATE KEY-----"
      }, 
      "version_created_at": "2017-01-01T04:07:18Z"
    }
  ]
}
```

This endpoint returns a credential by name. 

### HTTP Request

`GET: https://example.com/api/v1/data`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
name | none | Name of credential to retrieve 
current | false | Return only latest credential version 

## Type: RSA

> CredHub CLI

```shell
user$ credhub get --name '/example-rsa'
type: rsa
name: /example-rsa
value: 
  public_key: |
    -----BEGIN PUBLIC KEY-----
    ...
    -----END PUBLIC KEY-----
  private_key: |
    -----BEGIN RSA PRIVATE KEY-----
    ...
    -----END RSA PRIVATE KEY-----
updated: 2017-01-01T04:07:18Z
```

> cURL

```shell
curl "https://example.com/api/v1/data?name=/example-rsa" \
  -X GET \
  -H "authorization: bearer [token]" \
  -H 'content-type: application/json'
```

```json
{
  "data": [
    {
      "id": "67fc3def-bbfb-4953-83f8-4ab0682ad677",
      "name": "/example-rsa",
      "type": "rsa",
      "value": {
        "public_key": "-----BEGIN PUBLIC KEY-----\n...\n-----END PUBLIC KEY-----",
        "private_key": "-----BEGIN RSA PRIVATE KEY-----\n...\n-----END RSA PRIVATE KEY-----"
      },
      "version_created_at": "2017-01-01T04:07:18Z"
    }
  ]
}
```

This endpoint returns a credential by name. 

### HTTP Request

`GET: https://example.com/api/v1/data`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
name | none | Name of credential to retrieve 
current | false | Return only latest credential version 

## Type: SSH

> CredHub CLI

```shell
user$ credhub get --name '/example-ssh'
type: ssh
name: /example-ssh
value: 
  public_key: ssh-rsa AAAAB3Nz...
  private_key: |
    -----BEGIN RSA PRIVATE KEY-----
    ...
    -----END RSA PRIVATE KEY-----
updated: 2017-01-01T04:07:18Z
```

> cURL

```shell
curl "https://example.com/api/v1/data?name=/example-ssh" \
  -X GET \
  -H "authorization: bearer [token]" \
  -H 'content-type: application/json'
```

```json
{
  "data": [
    {
      "id": "67fc3def-bbfb-4953-83f8-4ab0682ad678",
      "name": "/example-ssh",
      "type": "ssh",
      "value": {
        "public_key": "ssh-rsa AAAAB3Nz...",
        "private_key": "-----BEGIN RSA PRIVATE KEY-----\n...\n-----END RSA PRIVATE KEY-----",
        "public_key_fingerprint": "EvI0/GIUgDjcoCzUQM+EtwnVTryNsKRd6TrHAGKJJSI"
      },
      "version_created_at": "2017-01-01T04:07:18Z"
    }
  ]
}
```

This endpoint returns a credential by name. 

### HTTP Request

`GET: https://example.com/api/v1/data`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
name | none | Name of credential to retrieve 
current | false | Return only latest credential version 

# Set Credentials

## Type: Value

> CredHub CLI

```shell
user$ credhub set --type value --name '/example-value' --value 'sample'
type: value
name: /example-value
value: sample
updated: 2017-01-01T04:07:18Z
```

> cURL

```shell
curl "https://example.com/api/v1/data" \
  -X PUT \
  -d '{ 
      "name": "/example-value", 
      "type": "value", 
      "value": "sample"
     }' \
  -H "authorization: bearer [token]" \
  -H 'content-type: application/json'
```

```json
{
  "id": "67fc3def-bbfb-4953-83f8-4ab0682ad675",
  "name": "/example-value",
  "type": "value",
  "value": "sample",
  "version_created_at": "2017-01-01T04:07:18Z"
}
```

This endpoint sets a value credential with a user-provided value. 

### HTTP Request

`PUT: https://example.com/api/v1/data`

### Request Parameters

Parameter | Default | Required | Type | Description
--------- | --------- | --------- | --------- | ------------
name | none | yes | string | Name of credential to set
type | none | yes | string | Type of credential to set
overwrite | false | no | boolean | Overwrite if value exists 
value | none | yes | string | Value of credential to set  

## Type: JSON

> CredHub CLI

```shell
user$ credhub set --type json --name '/example-json' --value '{ "key": 123, "key_list": ["val1","val2"],is_true: true }'
type: json
name: /example-json
value: 
  key: 123
  key_list: 
  - val1
  - val2
  is_true: true
updated: 2017-01-01T04:07:18Z
```

> cURL

```shell
curl "https://example.com/api/v1/data" \
  -X PUT \
  -d '{
      "name": "/example-json",
      "type": "json",
      "value": {
        "key": 123,
        "key_list": [
          "val1",
          "val2"
        ],
        "is_true": true
      }
     }' \
  -H "authorization: bearer [token]" \
  -H 'content-type: application/json'
```

```json
{
  "id": "67fc3def-bbfb-4953-83f8-4ab0682ad675",
  "name": "/example-json",
  "type": "json",
  "value": {
    "key": 123,
    "key_list": [
      "val1",
      "val2"
    ],
    "is_true": true
  },
  "version_created_at": "2017-01-01T04:07:18Z"
}
```

This endpoint sets a json credential with a user-provided value.

### HTTP Request

`PUT: https://example.com/api/v1/data`

### Request Parameters

Parameter | Default | Required | Type | Description
--------- | --------- | --------- | --------- | ------------
name | none | yes | string | Name of credential to set
type | none | yes | string | Type of credential to set
overwrite | false | no | boolean | Overwrite if value exists
value | none | yes | object | Value of credential to set

## Type: Password

> CredHub CLI

```shell
user$ credhub set --type password --name '/example-password' --value '3t6Y2OFP0jQIcLnki1h7p3NtSfDx4l9bamr1ja6R'
type: password
name: /example-password
value: 3t6Y2OFP0jQIcLnki1h7p3NtSfDx4l9bamr1ja6R
updated: 2017-01-01T04:07:18Z
```

> cURL

```shell
curl "https://example.com/api/v1/data" \
  -X PUT \
  -d '{ 
      "name": "/example-password", 
      "type": "password",
      "value": "3t6Y2OFP0jQIcLnki1h7p3NtSfDx4l9bamr1ja6R"
     }' \
  -H "authorization: bearer [token]" \
  -H 'content-type: application/json'
```

```json
{
  "id": "67fc3def-bbfb-4953-83f8-4ab0682ad675",
  "name": "/example-password",
  "type": "password",
  "value": "6mRPZB3bAfb8lRpacnXsHfDhlPqFcjH2h9YDvLpL",
  "version_created_at": "2017-01-05T01:01:01Z"
}
```

This endpoint sets a password credential with a user-provided value.

### HTTP Request

`PUT: https://example.com/api/v1/data`

### Request Parameters

Parameter | Default | Required | Type | Description
--------- | --------- | --------- | --------- | ------------
name | none | yes | string | Name of credential to set
type | none | yes | string | Type of credential to set
overwrite | false | no | boolean | Overwrite if value exists
value | none | yes | string | Value of credential to set

## Type: User

> CredHub CLI

```shell
user$ credhub set --type user --name '/example-user' --username 'FQnwWoxgSrDuqDLmeLpU' --password '6mRPZB3bAfb8lRpacnXsHfDhlPqFcjH2h9YDvLpL'
type: user
name: /example-user
value: 
  username: FQnwWoxgSrDuqDLmeLpU
  password: 6mRPZB3bAfb8lRpacnXsHfDhlPqFcjH2h9YDvLpL
updated: 2017-01-01T04:07:18Z
```

> cURL

```shell
curl "https://example.com/api/v1/data" \
  -X PUT \
  -d '{ 
      "name": "/example-user",
      "type": "user", 
      "value": {
        "username": "FQnwWoxgSrDuqDLmeLpU",
        "password": "6mRPZB3bAfb8lRpacnXsHfDhlPqFcjH2h9YDvLpL"
      }
     }' \
  -H "authorization: bearer [token]" \
  -H 'content-type: application/json'
```

```json
{
  "id": "67fc3def-bbfb-4953-83f8-4ab0682ad675",
  "name": "/example-user",
  "type": "user",
  "value": {
    "username": "FQnwWoxgSrDuqDLmeLpU",
    "password": "6mRPZB3bAfb8lRpacnXsHfDhlPqFcjH2h9YDvLpL",
    "password_hash": "$6$uu8ybZiNiPRu$6AYClxVqMXA3LAIdDAnEuWLUlWGlm0RRJI2wdHd8R9hKkKtiYupyKBjdRBI1ZhsyHwYetCpySew9ZXXLf.Mih0"
  },
  "version_created_at": "2017-01-05T01:01:01Z"
}
```

This endpoint sets a user credential with a user-provided value.

### HTTP Request

`PUT: https://example.com/api/v1/data`

### Request Parameters

Parameter | Default | Required | Type | Description
--------- | --------- | --------- | --------- | ------------
name | none | yes | string | Name of credential to set
type | none | yes | string | Type of credential to set
overwrite | false | no | boolean | Overwrite if value exists
value | none | yes | object | 
value.username | null | no | string | Username value of credential to set
value.password | none | yes | string | Password value of credential to set

## Type: Certificate

> CredHub CLI

```shell
user$ credhub set --type certificate --name '/example-certificate' --root ./root.pem --certificate ./cert.pem --private ./private.pem
type: certificate
name: /example-certificate
value: 
  root: |
    -----BEGIN CERTIFICATE-----
    ...
    -----END CERTIFICATE-----
  certificate: |
    -----BEGIN CERTIFICATE-----
    ...
    -----END CERTIFICATE-----
  private_key: |
    -----BEGIN RSA PRIVATE KEY-----
    ...
    -----END RSA PRIVATE KEY-----
updated: 2017-01-01T04:07:18Z
```

> cURL

```shell
curl "https://example.com/api/v1/data" \
  -X PUT \
  -d '{
      "name": "/example-certificate",
      "type": "certificate", 
      "value": {
        "ca": "-----BEGIN CERTIFICATE-----\n...\n-----END CERTIFICATE-----",
        "certificate": "-----BEGIN CERTIFICATE-----\n...\n-----END CERTIFICATE-----",
        "private_key": "-----BEGIN RSA PRIVATE KEY-----\n...\n-----END RSA PRIVATE KEY-----"
      }
     }' \
  -H "authorization: bearer [token]" \
  -H 'content-type: application/json'
```

```json
{
  "id": "67fc3def-bbfb-4953-83f8-4ab0682ad676",
  "name": "/example-certificate",
  "type": "certificate",
  "value": {
    "ca": "-----BEGIN CERTIFICATE-----\n...\n-----END CERTIFICATE-----",
    "certificate": "-----BEGIN CERTIFICATE-----\n...\n-----END CERTIFICATE-----",
    "private_key": "-----BEGIN RSA PRIVATE KEY-----\n...\n-----END RSA PRIVATE KEY-----"
  }, 
  "version_created_at": "2017-01-01T04:07:18Z"
}
```

This endpoint sets a certificate credential with a user-provided value.

### HTTP Request

`PUT: https://example.com/api/v1/data`

### Request Parameters

Parameter | Default | Required | Type | Description
--------- | --------- | --------- | --------- | ------------
name | none | yes | string | Name of credential to set
type | none | yes | string | Type of credential to set
overwrite | false | no | boolean | Overwrite if value exists
value | none | yes | object | 
value.ca | null | no<sup>1</sup> | string | Certificate authority value of credential to set 
value.certificate | null | no<sup>1</sup> | string | Certificate value of credential to set 
value.private_key | null | no<sup>1</sup> | string | Private key value of credential to set 

<sup>1</sup> At least one value must be set 

## Type: RSA

> CredHub CLI

```shell
user$ credhub set --type rsa --name '/example-rsa' --public ./public.pem --private ./private.pem
type: rsa
name: /example-rsa
value: 
  public_key: |
    -----BEGIN PUBLIC KEY-----
    ...
    -----END PUBLIC KEY-----
  private_key: |
    -----BEGIN RSA PRIVATE KEY-----
    ...
    -----END RSA PRIVATE KEY-----
updated: 2017-01-01T04:07:18Z
```

> cURL

```shell
curl "https://example.com/api/v1/data" \
  -X PUT \
  -d '{
      "name": "/example-rsa",
      "type": "rsa", 
      "value": {
        "public_key": "-----BEGIN PUBLIC KEY-----\n...\n-----END PUBLIC KEY-----",
        "private_key": "-----BEGIN RSA PRIVATE KEY-----\n...\n-----END RSA PRIVATE KEY-----"
      }
     }' \
  -H "authorization: bearer [token]" \
  -H 'content-type: application/json'
```

```json
{
  "id": "67fc3def-bbfb-4953-83f8-4ab0682ad676",
  "name": "/example-rsa",
  "type": "rsa",
  "value": {
    "public_key": "-----BEGIN PUBLIC KEY-----\n...\n-----END PUBLIC KEY-----",
    "private_key": "-----BEGIN RSA PRIVATE KEY-----\n...\n-----END RSA PRIVATE KEY-----"
  }, 
  "version_created_at": "2017-01-01T04:07:18Z"
}
```

This endpoint sets a RSA credential with a user-provided value.

### HTTP Request

`PUT: https://example.com/api/v1/data`

### Request Parameters

Parameter | Default | Required | Type | Description
--------- | --------- | --------- | --------- | ------------
name | none | yes | string | Name of credential to set
type | none | yes | string | Type of credential to set
overwrite | false | no | boolean | Overwrite if value exists
value | none | yes | object | 
value.public_key | null | no<sup>1</sup> | string | Public key value of credential to set 
value.private_key | null | no<sup>1</sup> | string | Private key value of credential to set 

<sup>1</sup> At least one value must be set 

## Type: SSH

> CredHub CLI

```shell
user$ credhub set --type ssh --name '/example-ssh' --public ./public.pem --private ./private.pem
type: ssh
name: /example-ssh
value: 
  public_key: ssh-rsa AAAAB3NzaC1y...W9RWFM1
  private_key: |
    -----BEGIN RSA PRIVATE KEY-----
    ...
    -----END RSA PRIVATE KEY-----
updated: 2017-01-01T04:07:18Z
```

> cURL

```shell
curl "https://example.com/api/v1/data" \
  -X PUT \
  -d '{
      "name": "/example-ssh",
      "type": "ssh", 
      "value": {
        "public_key": "ssh-rsa AAAAB3NzaC1y...W9RWFM1", 
        "private_key": "-----BEGIN RSA PRIVATE KEY-----\n...\n-----END RSA PRIVATE KEY-----"
      }
     }' \
  -H "authorization: bearer [token]" \
  -H 'content-type: application/json'
```

```json
{
  "id": "67fc3def-bbfb-4953-83f8-4ab0682ad676",
  "name": "/example-ssh",
  "type": "ssh",
  "value": {
    "public_key": "ssh-rsa AAAAB3NzaC1y...W9RWFM1", 
    "private_key": "-----BEGIN RSA PRIVATE KEY-----\n...\n-----END RSA PRIVATE KEY-----"
  }, 
  "version_created_at": "2017-01-01T04:07:18Z"
}
```

This endpoint sets a SSH credential with a user-provided value.

### HTTP Request

`PUT: https://example.com/api/v1/data`

### Request Parameters

Parameter | Default | Required | Type | Description
--------- | --------- | --------- | --------- | ------------
name | none | yes | string | Name of credential to set
type | none | yes | string | Type of credential to set
overwrite | false | no | boolean | Overwrite if value exists
value | none | yes | object | 
value.public_key | null | no<sup>1</sup> | string | Public key value of credential to set 
value.private_key | null | no<sup>1</sup> | string | Private key value of credential to set 

<sup>1</sup> At least one value must be set 

# Generate Credentials

## Type: Password

> CredHub CLI

```shell
user$ credhub generate --type password --name '/example-password'
type: password
name: /example-password
value: 3t6Y2OFP0jQIcLnki1h7p3NtSfDx4l9bamr1ja6R
updated: 2017-01-01T04:07:18Z
```

> cURL

```shell
curl "https://example.com/api/v1/data" \
  -X POST \
  -d '{ 
      "name": "/example-password", 
      "type": "password"
      "parameters": {
        "length": 40
      }
     }' \
  -H "authorization: bearer [token]" \
  -H 'content-type: application/json'
```

```json
{
  "id": "67fc3def-bbfb-4953-83f8-4ab0682ad675",
  "name": "/example-password",
  "type": "password",
  "value": "6mRPZB3bAfb8lRpacnXsHfDhlPqFcjH2h9YDvLpL",
  "version_created_at": "2017-01-05T01:01:01Z"
}
```

This endpoint generates a password credential based on the provided parameters. 

### HTTP Request

`POST: https://example.com/api/v1/data`

### Request Parameters

Parameter | Default | Required | Type | Description
--------- | --------- | --------- | --------- | ------------
name | none | yes | string | Name of credential to set
type | none | yes | string | Type of credential to set
overwrite | false | no | boolean | Overwrite if value exists
parameters | none | no | object | Generation parameters
parameters.length | 30 | no | integer | Length of generated credential value
parameters.exclude_upper | false | no | boolean | Exclude upper alpha characters from generated credential value 
parameters.exclude_lower | false | no | boolean | Exclude lower alpha characters from generated credential value 
parameters.exclude_number | false | no | boolean | Exclude number characters from generated credential value  
parameters.include_special | false | no | boolean | Include special characters from generated credential value 

## Type: User

> CredHub CLI

```shell
user$ credhub generate --type user --name '/example-user'
type: user
name: /example-user
value: 
  username: FQnwWoxgSrDuqDLmeLpU
  password: 6mRPZB3bAfb8lRpacnXsHfDhlPqFcjH2h9YDvLpL
updated: 2017-01-01T04:07:18Z
```

> cURL

```shell
curl "https://example.com/api/v1/data" \
  -X POST \
  -d '{ 
      "name": "/example-user",
      "type": "user"
      "parameters": {
        "length": 40
      }
     }' \
  -H "authorization: bearer [token]" \
  -H 'content-type: application/json'
```

```json
{
  "id": "67fc3def-bbfb-4953-83f8-4ab0682ad675",
  "name": "/example-user",
  "type": "user",
  "value": {
    "username": "FQnwWoxgSrDuqDLmeLpU",
    "password": "6mRPZB3bAfb8lRpacnXsHfDhlPqFcjH2h9YDvLpL"
  },
  "version_created_at": "2017-01-05T01:01:01Z"
}
```

This endpoint generates a user credential based on the provided parameters. 

### HTTP Request

`POST: https://example.com/api/v1/data`

### Request Parameters

Parameter | Default | Required | Type | Description
--------- | --------- | --------- | --------- | ------------
name | none | yes | string | Name of credential to set
type | none | yes | string | Type of credential to set
overwrite | false | no | boolean | Overwrite if value exists
value | none | no | object | 
value.username | none | no | string | User provided value for username
parameters | none | no | object | Password generation parameters
parameters.length | 30 | no | integer | Length of generated credential value
parameters.exclude_upper | false | no | boolean | Exclude upper alpha characters from generated credential value 
parameters.exclude_lower | false | no | boolean | Exclude lower alpha characters from generated credential value 
parameters.exclude_number | false | no | boolean | Exclude number characters from generated credential value  
parameters.include_special | false | no | boolean | Include special characters from generated credential value 

## Type: Certificate

> CredHub CLI

```shell
user$ credhub generate --type certificate --name '/example-certificate' --common-name 'example.com' --ca '/example-ca'
type: certificate
name: /example-certificate
value: 
  root: |
    -----BEGIN CERTIFICATE-----
    ...
    -----END CERTIFICATE-----
  certificate: |
    -----BEGIN CERTIFICATE-----
    ...
    -----END CERTIFICATE-----
  private_key: |
    -----BEGIN RSA PRIVATE KEY-----
    ...
    -----END RSA PRIVATE KEY-----
updated: 2017-01-01T04:07:18Z
```

> cURL

```shell
curl "https://example.com/api/v1/data" \
  -X POST \
  -d '{ 
      "name": "/example-certificate", 
      "type": "certificate"
      "parameters": {
        "common_name": "example.com",
        "ca": "/example-ca"
      }
     }' \
  -H "authorization: bearer [token]" \
  -H 'content-type: application/json'
```

```json
{
  "data": [
    {
      "id": "67fc3def-bbfb-4953-83f8-4ab0682ad676",
      "name": "/example-certificate",
      "type": "certificate",
      "value": {
        "ca": "-----BEGIN CERTIFICATE-----\n...\n-----END CERTIFICATE-----",
        "certificate": "-----BEGIN CERTIFICATE-----\n...\n-----END CERTIFICATE-----",
        "private_key": "-----BEGIN RSA PRIVATE KEY-----\n...\n-----END RSA PRIVATE KEY-----"
      }, 
      "version_created_at": "2017-01-01T04:07:18Z"
    }
  ]
}
```

This endpoint generates a user credential based on the provided parameters.

### HTTP Request

`POST: https://example.com/api/v1/data`

### Request Parameters

Parameter | Default | Required | Type | Description
--------- | --------- | --------- | --------- | ------------
name | none | yes | string | Name of credential to generate
type | none | yes | string | Type of credential to generate
overwrite | false | no | boolean | Overwrite if value exists
parameters | none | yes | object | Generation parameters
parameters.common_name | none | no<sup>1</sup> | string | Common name of generated credential value
parameters.alternative_names | none | no | array | 
parameters.alternative_names[] | none | no | string | Alternative names of generated credential value
parameters.organization | none | no<sup>1</sup> | string | Organization of generated credential value
parameters.organization_unit | none | no<sup>1</sup> | string | Organization Unit of generated credential value
parameters.locality | none | no<sup>1</sup> | string | Locality/city of generated credential value
parameters.state | none | no<sup>1</sup> | string | State/province of generated credential value
parameters.country | none | no<sup>1</sup> | string | Country of generated credential value
parameters.key_length | 2048 | no | enum<sup>2</sup> | Key length of generated credential value
parameters.duration | 365 | no | integer | Duration in days of generated credential value
parameters.ca | none | no<sup>3</sup> | credential<sup>4</sup> | Name of certificate authority to sign of generated credential value
parameters.is_ca | false | no<sup>3</sup> | boolean | Whether to generate credential value as a certificate authority
parameters.self_sign | false | no<sup>3</sup> | boolean | Whether to self-sign generated credential value

<sup>1</sup> One subject field must be specified in the request <br>
<sup>2</sup> Acceptable key lengths are 2048, 3072, 4096 <br>
<sup>3</sup> At least one signing parameter must be provided <br>
<sup>4</sup> Credential must contain appropriate certificate authority extensions

## Type: RSA

> CredHub CLI

```shell
user$ credhub generate --type rsa --name '/example-rsa'
type: rsa
name: /example-rsa
value: 
  public_key: |
    -----BEGIN PUBLIC KEY-----
    ...
    -----END PUBLIC KEY-----
  private_key: |
    -----BEGIN RSA PRIVATE KEY-----
    ...
    -----END RSA PRIVATE KEY-----
updated: 2017-01-01T04:07:18Z
```

> cURL

```shell
curl "https://example.com/api/v1/data" \
  -X POST \
  -d '{ 
      "name": "/example-rsa", 
      "type": "rsa"
      "parameters": {
        "key_length": 4096
      }
     }' \
  -H "authorization: bearer [token]" \
  -H 'content-type: application/json'
```

```json
{
  "id": "67fc3def-bbfb-4953-83f8-4ab0682ad677",
  "name": "/example-rsa",
  "type": "rsa",
  "value": {
    "public_key": "-----BEGIN PUBLIC KEY-----\n...\n-----END PUBLIC KEY-----",
    "private_key": "-----BEGIN RSA PRIVATE KEY-----\n...\n-----END RSA PRIVATE KEY-----"
  },
  "version_created_at": "2017-01-01T04:07:18Z"
}
```

This endpoint generates an RSA credential based on the provided parameters.

### HTTP Request

`POST: https://example.com/api/v1/data`

### Request Parameters

Parameter | Default | Required | Type | Description
--------- | --------- | --------- | --------- | ------------
name | none | yes | string | Name of credential to set
type | none | yes | string | Type of credential to set
overwrite | false | no | boolean | Overwrite if value exists
parameters | none | no | object | Generation parameters
parameters.key_length | 2048 | no | enum<sup>1</sup> | Key length of generated credential value

<sup>1</sup>Acceptable key lengths are 2048, 3072, 4096 

## Type: SSH

> CredHub CLI

```shell
user$ credhub generate --type ssh --name '/example-ssh'
type: ssh
name: /example-ssh
value: 
  public_key: ssh-rsa AAAAB3NzaC1y...W9RWFM1
  private_key: |
    -----BEGIN RSA PRIVATE KEY-----
    ...
    -----END RSA PRIVATE KEY-----
updated: 2017-01-01T04:07:18Z
```

> cURL

```shell
curl "https://example.com/api/v1/data" \
  -X POST \
  -d '{ 
      "name": "/example-ssh", 
      "type": "ssh"
      "parameters": {
        "key_length": 4096
      }
     }' \
  -H "authorization: bearer [token]" \
  -H 'content-type: application/json'
```

```json
{
  "id": "67fc3def-bbfb-4953-83f8-4ab0682ad677",
  "name": "/example-ssh",
  "type": "ssh",
  "value": {
    "public_key": "ssh-rsa AAAAB3NzaC1y...W9RWFM1",
    "private_key": "-----BEGIN RSA PRIVATE KEY-----\n...\n-----END RSA PRIVATE KEY-----"
  },
  "version_created_at": "2017-01-01T04:07:18Z"
}
```

This endpoint generates an SSH credential based on the provided parameters.

### HTTP Request

`POST: https://example.com/api/v1/data`

### Request Parameters

Parameter | Default | Required | Type | Description
--------- | --------- | --------- | --------- | ------------
name | none | yes | string | Name of credential to set
type | none | yes | string | Type of credential to set
overwrite | false | no | boolean | Overwrite if value exists
parameters | none | no | object | Generation parameters
parameters.key_length | 2048 | no | enum<sup>1</sup> | Key length of generated credential value
parameters.ssh_comment | none | no | string | SSH comment of generated credential value

<sup>1</sup>Acceptable key lengths are 2048, 3072, 4096

# Regenerate Credentials

## Regenerate by Name

> CredHub CLI

```shell
user$ credhub regenerate --name '/example-password'
type: password
name: /example-password
value: 3t6Y2OFP0jQIcLnki1h7p3NtSfDx4l9bamr1ja6R
updated: 2017-01-01T04:07:18Z
```

> cURL

```shell
curl "https://example.com/api/v1/data" \
  -X POST \
  -d '{ 
      "name": "/example-password",
      "regenerate": true
     }' \
  -H "authorization: bearer [token]" \
  -H 'content-type: application/json'
```

```json
{
  "id": "67fc3def-bbfb-4953-83f8-4ab0682ad674",
  "name": "/example-password",
  "type": "password",
  "value": "3t6Y2OFP0jQIcLnki1h7p3NtSfDx4l9bamr1ja6R",
  "version_created_at": "2017-01-01T04:07:18Z"
}
```

This endpoint regenerates a credential using the same parameters as the stored value.

### HTTP Request

`POST: https://example.com/api/v1/data`

### Request Parameters

Parameter | Default | Required | Type | Description
--------- | --------- | --------- | --------- | -----------
name | none | yes | string | Name of credential to regenerate
regenerate | none | yes | boolean | Whether to regenerate credential
 

# Delete Credentials

## Delete by Name

> CredHub CLI

```shell
user$ credhub delete --name '/example-password'
Secret successfully deleted
```

> cURL

```shell
curl "https://example.com/api/v1/data?name=/example-password" \
  -X DELETE \
  -H "authorization: bearer [token]" \
  -H 'content-type: application/json'
```

```json
[Status 204 Empty]
```

This endpoint deletes a credential by name. 

### HTTP Request

`DELETE: https://example.com/api/v1/data`

### Query Parameters

Parameter | Default | Required | Type | Description
--------- | --------- | --------- | --------- | -----------
name | none | yes | string | Name of credential to delete
 
