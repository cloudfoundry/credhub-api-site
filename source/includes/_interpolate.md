# Interpolate Endpoint

> CredHub CLI

```shell
[not supported]
```

> cURL

```shell
curl "https://example.com/api/v1/interpolate" \
  -X POST \
  -d '{ 
      "p-config-server": [
      {
       "credentials": {
         "credhub-ref": "/config-server/credentials"
       },
       "label": "p-config-server",
       "name": "config-server",
       "plan": "standard",
       "provider": null,
       "syslog_drain_url": null,
       "tags": [
        "configuration",
        "spring-cloud"
       ],
       "volume_mounts": []
      }]
     }' \
  -H "authorization: bearer [token]" \
  -H 'content-type: application/json'
```

```json
{
  "p-config-server": [
  {
   "credentials": {
     "access_token_uri": "https://p-spring-cloud-services.uaa.example.com/oauth/token",
     "client_id": "p-config-server-d6ed7b18-5ae8-4642-af0c-11b1a47aad14",
     "client_secret": "example-secret",
     "uri": "https://config-2ad9cb93-d16d-4840-93ef-15b537c90847.apps.example.com"
   },
   "label": "p-config-server",
   "name": "config-server",
   "plan": "standard",
   "provider": null,
   "syslog_drain_url": null,
   "tags": [
    "configuration",
    "spring-cloud"
   ],
   "volume_mounts": []
   }]
}
```

This endpoint receives a `VCAP_SERVICES` object containing CredHub references and responds with the object containing the credential values interpolated.

NOTE: At this time, only credential references at `credentials.credhub-ref` will be interpolated. The key `credhub-ref` will be removed and the referenced credential object will be set as the value of `credentials`.

### HTTP Request

`POST: https://example.com/api/v1/interpolate`

### Query Parameters

Parameter | Default | Required | Type | Description
--------- | --------- | --------- | --------- | -----------
none | | | |
