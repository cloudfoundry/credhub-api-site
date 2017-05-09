---
title: CredHub API

language_tabs:
  - shell

toc_footers:
  - <a href='https://github.com/pivotal-danjahner/credhub-api-docs'>API Docs Source</a>
  - <a href='https://github.com/cloudfoundry-incubator/credhub'>CredHub Source</a>

includes:
  - get
  - set
  - generate
  - regenerate
  - delete
  - get-permission
  - add-permission
  - delete-permission
  - errors


search: true
---

# Introduction

CredHub manages credentials like passwords, users, certificates, certificate authorities, ssh keys, rsa keys and arbitrary values (strings and JSON blobs). The following spec details the API exposed by the CredHub server.

More information on CredHub [can be found here.](https://github.com/cloudfoundry-incubator/credhub)

# Authentication

All requests to CredHub, with the exception of `/info` and `/health` must include an authentication method. CredHub supports two authentication provider types, [UAA][1] and [mutual TLS][2].

[1]:https://github.com/cloudfoundry/uaa
[2]:https://github.com/cloudfoundry-incubator/credhub/blob/master/docs/initiatives/mutual-tls.md

## UAA (oAuth2)

> CredHub CLI 

```shell
user$ credhub login --server example.com
```

> cURL

```shell
curl "https://example.com/info" \
  -X GET \
  -H 'content-type: application/json'
```

```json
{
  "auth-server": {
    "url": "https://uaa.example.com:8443"
  },
  "app": {
    "name": "CredHub",
    "version": "0.7.0"
  }
}
```

Authentication via UAA is performed directly with the trusted UAA server. When successfully authenticated, the UAA server will return an access token, which must be sent to CredHub in each request. 

The address of the UAA server trusted by the targeted CredHub server can be obtained by requesting the `/info` endpoint. With that endpoint, you may send a token request [as detailed here.](https://docs.cloudfoundry.org/api/uaa/#password-grant)

Once you have obtained a token, you must include the token value in the header `authorization: bearer [token]` in your request to CredHub.

## Mutual TLS

> CredHub CLI 

```shell
[not supported]
```

> cURL

```shell
curl "https://example.com/api/v1/data?name=/example-password" \
  -X GET \
  -H 'content-type: application/json' \
  --cert certificate.pem \
  --key private_key.pem
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

CredHub supports mutual TLS authentication. Certificates issued by any of the trusted CA certificates are accepted by CredHub. 

CredHub validates the [authenticated identity][3], signing authority, validity dates and presence of x509 extension Extended Key Usage 'Client Authentication' during the authentication workflow.

[3]:https://github.com/cloudfoundry-incubator/credhub/blob/master/docs/initiatives/authentication-identities.md
