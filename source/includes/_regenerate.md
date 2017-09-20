# Regenerate Credentials

The regenerate endpoints generate new values for credentials using the same parameters as the stored value. All RSA and SSH credentials may be regenerated. Password and user credentials must have been generated to enable regeneration. Statically set certificates may be regenerated if they are self-signed or if the CA name has been set to a stored CA certificate.

## Single Credential

> CredHub CLI

```shell
user$ credhub regenerate --name '/example-password'
id: 67fc3def-bbfb-4953-83f8-4ab0682ad675
type: password
name: /example-password
value: 3t6Y2OFP0jQIcLnki1h7p3NtSfDx4l9bamr1ja6R
version_created_at: 2017-01-01T04:07:18Z
```

> cURL

```shell
curl "https://example.com/api/v1/regenerate" \
  -X POST \
  -d '{
      "name": "/example-password"
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

This request regenerates a single credential by name.

NOTICE: Server version 1.4.0+ supports regenerate at path `api/v1/regenerate`, modified from `api/v1/data` in prior versions. Regenerate functionality on the `data` endpoint is still functional, but deprecated. You are advised to migrate to `regenerate` to avoid disruption when the deprecated functionality is removed.

### HTTP Request

`POST: https://example.com/api/v1/regenerate`

### Request Parameters

Parameter | Default | Required | Type | Description
--------- | --------- | --------- | --------- | -----------
name | none | yes | string | Name of credential to regenerate

## Certificate Signed By a CA

> CredHub CLI

```shell
[not supported]
```

> cURL

```shell
curl "https://example.com/api/v1/bulk-regenerate" \
  -X POST \
  -d '{
      "signed_by": "/example-ca"
     }' \
  -H "authorization: bearer [token]" \
  -H 'content-type: application/json'
```

```json
{
    "regenerated_credentials": [
        "/example-cert1",
        "/example-cert2",
        "/example-cert3"
    ]
}
```

This endpoint regenerates all certificate signed by the given CA.

NOTICE: This functionality was added in version 1.4.0.

### HTTP Request

`POST: https://example.com/api/v1/bulk-regenerate`

### Request Parameters

Parameter | Default | Required | Type | Description
--------- | --------- | --------- | --------- | -----------
signed_by | none | yes | string | Name of CA whose signed certificates will be regenerated
