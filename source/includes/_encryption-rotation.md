# Encryption Key Usage

> CredHub CLI

```shell
[not supported]
```

> cURL

```shell
curl "https://example.com/api/v1/key-usage" \
  -X GET \
  -H "authorization: bearer [token]" \
  -H 'content-type: application/json'
```

```json
{
  "active_key": 141240,
  "inactive_keys": 0,
  "unknown_keys": 0
}
```

This endpoint retrieves the number of credentials encrypted by the active key, provided inactive keys and unknown keys. After initiating an encryption key rotation, you may validate the status of the encryption key rotation, and whether it successfully rotated all of the stored data, using this endpoint. 

### HTTP Request

`GET: https://example.com/api/v1/key-usage`

### Query Parameters

Parameter | Default | Required | Type | Description
--------- | --------- | --------- | --------- | -----------
none | | | |
