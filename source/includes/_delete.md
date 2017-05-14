# Delete Credentials

> CredHub CLI

```shell
user$ credhub delete --name '/example-password'
Credential successfully deleted
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

This request deletes a credential by name. 

### HTTP Request

`DELETE: https://example.com/api/v1/data`

### Query Parameters

Parameter | Default | Required | Type | Description
--------- | --------- | --------- | --------- | -----------
name | none | yes | string | Name of credential to delete
