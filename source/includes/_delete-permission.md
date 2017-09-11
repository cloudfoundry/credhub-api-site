# Delete Permissions

> CredHub CLI

```shell
[not supported]
```

> cURL

```shell
curl "https://example.com/api/v1/permissions?credential_name=/example-password&actor=uaa-user:f6b2f8f6-1654-4a5d-aba4-c4d024a43560" \
  -X DELETE \
  -H "authorization: bearer [token]" \
  -H 'content-type: application/json'
```

```json
[Status 204 Empty]
```

This request deletes a permission for an actor on a credential.

### HTTP Request

`DELETE: https://example.com/api/v1/permissions`

### Query Parameters

Parameter | Default | Required | Type | Description
--------- | --------- | --------- | --------- | -----------
credential_name | none | yes | string | Name of credential whose permissions will be deleted
actor | none | yes | identity<sup>1</sup> | Name of actor whose permissions will be deleted

<sup>1</sup> Authentication-specific identities [explained here.](https://github.com/cloudfoundry-incubator/credhub/blob/master/docs/authentication-identities.md)

