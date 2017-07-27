# Get Permissions

> CredHub CLI

```shell
[not supported]
```

> cURL

```shell
curl "https://example.com/api/v1/permissions?credential_name=/example-password" \
  -X GET \
  -H "authorization: bearer [token]" \
  -H 'content-type: application/json'
```

```json
{
  "credential_name": "/example-password",
  "permissions": [
    {
      "actor": "uaa-user:106f52e2-5d01-4675-8d7a-c05ff9a2c081",
      "operations": [
        "read",
        "write",
        "delete",
        "read_acl",
        "write_acl"
      ]
    }
  ]
}
```

This request returns the permissions of a credential. 

### HTTP Request

`GET: https://example.com/api/v1/permissions`

### Query Parameters

Parameter | Default | Required | Type | Description
--------- | --------- | --------- | --------- | -----------
credential_name | none | yes | string | Name of credential whose permissions will be returned
