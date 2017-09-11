# Add Permissions

> CredHub CLI

```shell
[not supported]
```

> cURL

```shell
curl "https://example.com/api/v1/permissions" \
  -X POST \
  -d '{
      "credential_name": "/example-password",
      "permissions": [
      {
        "actor": "uaa-user:f6b2f8f6-1654-4a5d-aba4-c4d024a43560",
        "operations": ["read"]
      }]
     }' \
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
    },{
      "actor": "uaa-user:f6b2f8f6-1654-4a5d-aba4-c4d024a43560",
      "operations": ["read"]
    }
  ]
}
```

This request adds permissions to a credential.

### HTTP Request

`POST: https://example.com/api/v1/permissions`

### Request Parameters

Parameter | Default | Required | Type | Description
--------- | --------- | --------- | --------- | -----------
credential_name | none | yes | string | Name of credential whose permissions will be returned
permissions[] | none | yes | array | Permissions to add
permissions[n].actor | none | yes | identity<sup>1</sup> | Actor provided permission
permissions[n].operations[] | none | yes | array | Operations to add
permissions[n].operations[n] | none | yes | operation<sup>2</sup> | Operation provided to Actor

<sup>1</sup> Authentication-specific identities [explained here.](https://github.com/cloudfoundry-incubator/credhub/blob/master/docs/authentication-identities.md) <br>
<sup>2</sup> Supported operations: read, write, delete, read_acl, write_acl

