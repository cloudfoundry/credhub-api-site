---
title: CredHub API

language_tabs:
  - shell

toc_footers:
  - <a href='https://github.com/cloudfoundry-incubator/credhub-api-site'>API Docs Source</a>
  - <a href='https://github.com/cloudfoundry-incubator/credhub'>CredHub Source</a>

includes:
  - credentials
  - get
  - set
  - generate
  - regenerate
  - delete
  - find
  - permissions
  - get-permission
  - add-permission
  - delete-permission
  - interpolate
  - encryption-rotation
  - errors
  - integrations


search: true
---

# Introduction

CredHub manages credentials like passwords, users, certificates, certificate authorities, ssh keys, rsa keys and arbitrary values (strings and JSON blobs). The following spec details the API exposed by the CredHub server and the equivalent requests using the [CredHub CLI.](https://github.com/cloudfoundry-incubator/credhub-cli)

More information on CredHub [can be found here.](https://github.com/cloudfoundry-incubator/credhub)

## Credential Naming and Paths

Credentials can be named with any value up to 255 characters containing alpha, numeric, underscore `_`, hyphen `-`, and forward slash `/` characters. The character limit includes the leading slash, which will be prepended automatically if absent.

Paths can be used to namespace a set of credential names for a different deployment or environment. To add a path to a credential, simply add the path prior to the credential name, separated by a forward slash (/), e.g. `credhub set -t password -n /prod/deploy123/cc_password -v 'value'`. If a leading slash is not provided, it will be automatically prepended.

## Credential IDs

Credential responses include a unique identifier in the key 'id'. This ID is a unique identifier for a specific credential version. When a credential value is updated, a new ID will be returned. This identifier can be is useful in applications where a specific credential value should be pinned until a manual action (such as a deployment) is performed. If your application should receive the latest value of the credential, retrieving by name is preferred.

## Overwriting Credential Values

By default, credential set and generate actions with the API will not overwrite an existing value. If you wish to only create values that do not exist, you can perform generate requests on all of the credentials and it leave existing values in place. This mode is the default, but can be specified as `"mode" : "no-overwrite"`.

If you wish to overwrite existing values, you can set 'mode' as 'overwrite' or 'converge'.  When `"mode" : "converge"` is set, a new value will be generated only if the generation parameters have changed.  When `"mode" : "overwrite"` is set, a new credential is generated in every case.

In versions prior to 1.6, `mode` is not available. Instead `overwrite` is indicated as a boolean value. If you wish to overwrite existing values, you should then include the `"overwrite": true` parameter in your request.
# Authentication

All requests to CredHub, with the exception of `/info` and `/health` must include an authentication method. CredHub supports two authentication provider types, [UAA][1] and [mutual TLS][2].

[1]:https://github.com/cloudfoundry/uaa
[2]:https://github.com/cloudfoundry-incubator/credhub/blob/master/docs/mutual-tls.md

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
    "version": "1.2.0"
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

CredHub supports mutual TLS authentication. Certificates issued by trusted Certificate Authorities are accepted by CredHub.
To provide an authenticated identity in the client mtls certificate, CredHub requires the Organization Unit of the certificate to comply with the pattern `app:<v4 UUId>`.
CredHub validates the [authenticated identity][3], signing authority, validity dates and presence of x509 extension Extended Key Usage 'Client Authentication' during the authentication workflow.

[3]:https://github.com/cloudfoundry-incubator/credhub/blob/master/docs/authentication-identities.md
