# Regenerate Credentials

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
