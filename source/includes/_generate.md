# Generate Credentials

## Type: Password

> CredHub CLI

```shell
user$ credhub generate --type password --name '/example-password'
id: 67fc3def-bbfb-4953-83f8-4ab0682ad675
type: password
name: /example-password
value: 3t6Y2OFP0jQIcLnki1h7p3NtSfDx4l9bamr1ja6R
version_created_at: 2017-01-01T04:07:18Z
```

> cURL

```shell
curl "https://example.com/api/v1/data" \
  -X POST \
  -d '{
      "name": "/example-password",
      "type": "password"
      "parameters": {
        "length": 40
      }
     }' \
  -H "authorization: bearer [token]" \
  -H 'content-type: application/json'
```

```json
{
  "id": "67fc3def-bbfb-4953-83f8-4ab0682ad675",
  "name": "/example-password",
  "type": "password",
  "value": "6mRPZB3bAfb8lRpacnXsHfDhlPqFcjH2h9YDvLpL",
  "version_created_at": "2017-01-05T01:01:01Z"
}
```

This request generates a password credential based on the provided parameters.

### HTTP Request

`POST: https://example.com/api/v1/data`

### Request Parameters

Parameter | Default | Required | Type | Description
--------- | -------------- | --------- | --------- | ------------
name | none | yes | string | Name of credential to set
type | none | yes | string | Type of credential to set
mode | no-overwrite | no | enum<sup>1</sup> | Overwrite interaction mode
parameters | none | no | object | Generation parameters
parameters.length | 30 | no | integer | Length of generated credential value
parameters.exclude_upper | false | no | boolean | Exclude upper alpha characters from generated credential value
parameters.exclude_lower | false | no | boolean | Exclude lower alpha characters from generated credential value
parameters.exclude_number | false | no | boolean | Exclude number characters from generated credential value
parameters.include_special | false | no | boolean | Include special characters from generated credential value
additional_permissions | none | no | array | List of additional permissions to set on credential
additional_permissions[].actor | none | no | identity<sup>2</sup> | Actor to provided specified operations on credential
additional_permissions[].operations | none | no | array | List of operations provided on credential to specified actor
additional_permissions[].operations[] | none | no | enum<sup>3</sup> | Operation provided on credential to specified actor

<sup>1</sup> Acceptable modes are 'no-overwrite', 'overwrite', and 'converge' [explained here.](https://credhub-api.cfapps.io/#overwriting-credential-values) <br>
<sup>2</sup> Authentication-specific identities [explained here.](https://github.com/cloudfoundry-incubator/credhub/blob/master/docs/authentication-identities.md) <br>
<sup>3</sup> Acceptable operations are 'read', 'write', 'delete', 'read_acl', and 'write_acl'

## Type: User

> CredHub CLI

```shell
user$ credhub generate --type user --name '/example-user'
id: 67fc3def-bbfb-4953-83f8-4ab0682ad675
type: user
name: /example-user
value:
  username: FQnwWoxgSrDuqDLmeLpU
  password: 6mRPZB3bAfb8lRpacnXsHfDhlPqFcjH2h9YDvLpL
  password_hash: $6$h3b3JsG5$MnrPIrF6T3zAWk9uaun64vWY.vaBQ5nTRFZjjVqKuDWccxWXn8n6vstQykXEReamb4GYh2q1HC7vFy11wflXd0
version_created_at: 2017-01-01T04:07:18Z
```

> cURL

```shell
curl "https://example.com/api/v1/data" \
  -X POST \
  -d '{
      "name": "/example-user",
      "type": "user"
      "parameters": {
        "length": 40
      }
     }' \
  -H "authorization: bearer [token]" \
  -H 'content-type: application/json'
```

```json
{
  "id": "67fc3def-bbfb-4953-83f8-4ab0682ad675",
  "name": "/example-user",
  "type": "user",
  "value": {
    "username": "FQnwWoxgSrDuqDLmeLpU",
    "password": "6mRPZB3bAfb8lRpacnXsHfDhlPqFcjH2h9YDvLpL"
  },
  "version_created_at": "2017-01-05T01:01:01Z"
}
```

This request generates a user credential based on the provided parameters.

NOTE: The username value is accepted at `value.username` in CredHub server 1.2.0 and prior. This has been deprecated in favor of `parameters.username`.

### HTTP Request

`POST: https://example.com/api/v1/data`

### Request Parameters

Parameter | Default | Required | Type | Description
--------- | --------- | --------- | --------- | ------------
name | none | yes | string | Name of credential to set
type | none | yes | string | Type of credential to set
mode | no-overwrite | no | enum<sup>1</sup> | Overwrite interaction mode
parameters | none | no | object | Password generation parameters
parameters.username | none | no | string | User provided value for username
parameters.length | 30 | no | integer | Length of generated credential value
parameters.exclude_upper | false | no | boolean | Exclude upper alpha characters from generated credential value
parameters.exclude_lower | false | no | boolean | Exclude lower alpha characters from generated credential value
parameters.exclude_number | false | no | boolean | Exclude number characters from generated credential value
parameters.include_special | false | no | boolean | Include special characters from generated credential value
additional_permissions | none | no | array | List of additional permissions to set on credential
additional_permissions[].actor | none | no | identity<sup>2</sup> | Actor to provided specified operations on credential
additional_permissions[].operations | none | no | array | List of operations provided on credential to specified actor
additional_permissions[].operations[] | none | no | enum<sup>3</sup> | Operation provided on credential to specified actor

<sup>1</sup> Acceptable modes are 'no-overwrite', 'overwrite', and 'converge' [explained here.](https://credhub-api.cfapps.io/#overwriting-credential-values) <br>
<sup>2</sup> Authentication-specific identities [explained here.](https://github.com/cloudfoundry-incubator/credhub/blob/master/docs/authentication-identities.md) <br>
<sup>3</sup> Acceptable operations are 'read', 'write', 'delete', 'read_acl' and 'write_acl'

## Type: Certificate

> CredHub CLI

```shell
user$ credhub generate --type certificate --name '/example-certificate' --common-name 'example.com' --ca '/example-ca'
id: 67fc3def-bbfb-4953-83f8-4ab0682ad675
type: certificate
name: /example-certificate
value:
  root: |
    -----BEGIN CERTIFICATE-----
    ...
    -----END CERTIFICATE-----
  certificate: |
    -----BEGIN CERTIFICATE-----
    ...
    -----END CERTIFICATE-----
  private_key: |
    -----BEGIN RSA PRIVATE KEY-----
    ...
    -----END RSA PRIVATE KEY-----
version_created_at: 2017-01-01T04:07:18Z
```

> cURL

```shell
curl "https://example.com/api/v1/data" \
  -X POST \
  -d '{
      "name": "/example-certificate",
      "type": "certificate"
      "parameters": {
        "common_name": "example.com",
        "ca": "/example-ca"
      }
     }' \
  -H "authorization: bearer [token]" \
  -H 'content-type: application/json'
```

```json
{
  "id": "67fc3def-bbfb-4953-83f8-4ab0682ad676",
  "name": "/example-certificate",
  "type": "certificate",
  "value": {
    "ca": "-----BEGIN CERTIFICATE-----\n...\n-----END CERTIFICATE-----",
    "certificate": "-----BEGIN CERTIFICATE-----\n...\n-----END CERTIFICATE-----",
    "private_key": "-----BEGIN RSA PRIVATE KEY-----\n...\n-----END RSA PRIVATE KEY-----"
  },
  "version_created_at": "2017-01-01T04:07:18Z"
}
```

This request generates a user credential based on the provided parameters.

### HTTP Request

`POST: https://example.com/api/v1/data`

### Request Parameters

Parameter | Default | Required | Type | Description
--------- | --------- | --------- | --------- | ------------
name | none | yes | string | Name of credential to generate
type | none | yes | string | Type of credential to generate
mode | no-overwrite | no | enum<sup>1</sup> | Overwrite interaction mode
parameters | none | yes | object | Generation parameters
parameters.common_name | none | no<sup>2</sup> | string | Common name of generated credential value
parameters.alternative_names | none | no | array |
parameters.alternative_names[] | none | no | string | Alternative names of generated credential value
parameters.organization | none | no<sup>2</sup> | string | Organization of generated credential value
parameters.organization_unit | none | no<sup>2</sup> | string | Organization Unit of generated credential value
parameters.locality | none | no<sup>2</sup> | string | Locality/city of generated credential value
parameters.state | none | no<sup>2</sup> | string | State/province of generated credential value
parameters.country | none | no<sup>2</sup> | string | Country of generated credential value
parameters.key_usage | none | no | array |
parameters.key_usage[] | none | no | enum<sup>3</sup> | Key usage extensions of generated credential value
parameters.extended_key_usage | none | no | array |
parameters.extended_key_usage[] | none | no | enum<sup>4</sup> | Extended key usage extensions of generated credential value
parameters.key_length | 2048 | no | enum<sup>5</sup> | Key length of generated credential value
parameters.duration | 365 | no | integer | Duration in days of generated credential value
parameters.ca | none | no<sup>6</sup> | credential<sup>7</sup> | Name of certificate authority to sign of generated credential value
parameters.is_ca | false | no<sup>6</sup> | boolean | Whether to generate credential value as a certificate authority
parameters.self_sign | false | no<sup>6</sup> | boolean | Whether to self-sign generated credential value
additional_permissions | none | no | array | List of additional permissions to set on credential
additional_permissions[].actor | none | no | identity<sup>8</sup> | Actor to provided specified operations on credential
additional_permissions[].operations | none | no | array | List of operations provided on credential to specified actor
additional_permissions[].operations[] | none | no | enum<sup>9</sup> | Operation provided on credential to specified actor

<sup>1</sup> Acceptable modes are 'no-overwrite', 'overwrite', and 'converge' [explained here.](https://credhub-api.cfapps.io/#overwriting-credential-values) <br>
<sup>2</sup> One subject field must be specified in the request <br>
<sup>3</sup> Acceptable key usages are digital_signature, non_repudiation, key_encipherment, data_encipherment, key_agreement, key_cert_sign, crl_sign, encipher_only and decipher_only.<br>
<sup>4</sup> Acceptable extended key usages are client_auth, server_auth, code_signing, email_protection and timestamping.<br>
<sup>5</sup> Acceptable key lengths are 2048, 3072, 4096 <br>
<sup>6</sup> At least one signing parameter must be provided <br>
<sup>7</sup> Credential must contain appropriate certificate authority extensions  <br>
<sup>8</sup> Authentication-specific identities [explained here.](https://github.com/cloudfoundry-incubator/credhub/blob/master/docs/authentication-identities.md) <br>
<sup>9</sup> Acceptable operations are 'read', 'write', 'delete', 'read_acl' and 'write_acl'

## Type: RSA

> CredHub CLI

```shell
user$ credhub generate --type rsa --name '/example-rsa'
id: 67fc3def-bbfb-4953-83f8-4ab0682ad675
type: rsa
name: /example-rsa
value:
  public_key: |
    -----BEGIN PUBLIC KEY-----
    ...
    -----END PUBLIC KEY-----
  private_key: |
    -----BEGIN RSA PRIVATE KEY-----
    ...
    -----END RSA PRIVATE KEY-----
version_created_at: 2017-01-01T04:07:18Z
```

> cURL

```shell
curl "https://example.com/api/v1/data" \
  -X POST \
  -d '{
      "name": "/example-rsa",
      "type": "rsa"
      "parameters": {
        "key_length": 4096
      }
     }' \
  -H "authorization: bearer [token]" \
  -H 'content-type: application/json'
```

```json
{
  "id": "67fc3def-bbfb-4953-83f8-4ab0682ad677",
  "name": "/example-rsa",
  "type": "rsa",
  "value": {
    "public_key": "-----BEGIN PUBLIC KEY-----\n...\n-----END PUBLIC KEY-----",
    "private_key": "-----BEGIN RSA PRIVATE KEY-----\n...\n-----END RSA PRIVATE KEY-----"
  },
  "version_created_at": "2017-01-01T04:07:18Z"
}
```

This request generates an RSA credential based on the provided parameters.

### HTTP Request

`POST: https://example.com/api/v1/data`

### Request Parameters

Parameter | Default | Required | Type | Description
--------- | --------- | --------- | --------- | ------------
name | none | yes | string | Name of credential to set
type | none | yes | string | Type of credential to set
mode | no-overwrite | no | enum<sup>1</sup> | Overwrite interaction mode
parameters | none | no | object | Generation parameters
parameters.key_length | 2048 | no | enum<sup>2</sup> | Key length of generated credential value
additional_permissions | none | no | array | List of additional permissions to set on credential
additional_permissions[].actor | none | no | identity<sup>3</sup> | Actor to provided specified operations on credential
additional_permissions[].operations | none | no | array | List of operations provided on credential to specified actor
additional_permissions[].operations[] | none | no | enum<sup>4</sup> | Operation provided on credential to specified actor

<sup>1</sup> Acceptable modes are 'no-overwrite', 'overwrite', and 'converge' [explained here.](https://credhub-api.cfapps.io/#overwriting-credential-values) <br>
<sup>2</sup> Acceptable key lengths are 2048, 3072, 4096  <br>
<sup>3</sup> Authentication-specific identities [explained here.](https://github.com/cloudfoundry-incubator/credhub/blob/master/docs/authentication-identities.md) <br>
<sup>4</sup> Acceptable operations are 'read', 'write', 'delete', 'read_acl' and 'write_acl'

## Type: SSH

> CredHub CLI

```shell
user$ credhub generate --type ssh --name '/example-ssh'
id: 67fc3def-bbfb-4953-83f8-4ab0682ad675
type: ssh
name: /example-ssh
value:
  public_key: ssh-rsa AAAAB3NzaC1y...W9RWFM1
  private_key: |
    -----BEGIN RSA PRIVATE KEY-----
    ...
    -----END RSA PRIVATE KEY-----
version_created_at: 2017-01-01T04:07:18Z
```

> cURL

```shell
curl "https://example.com/api/v1/data" \
  -X POST \
  -d '{
      "name": "/example-ssh",
      "type": "ssh"
      "parameters": {
        "key_length": 4096
      }
     }' \
  -H "authorization: bearer [token]" \
  -H 'content-type: application/json'
```

```json
{
  "id": "67fc3def-bbfb-4953-83f8-4ab0682ad677",
  "name": "/example-ssh",
  "type": "ssh",
  "value": {
    "public_key": "ssh-rsa AAAAB3NzaC1y...W9RWFM1",
    "private_key": "-----BEGIN RSA PRIVATE KEY-----\n...\n-----END RSA PRIVATE KEY-----"
  },
  "version_created_at": "2017-01-01T04:07:18Z"
}
```

This request generates an SSH credential based on the provided parameters.

### HTTP Request

`POST: https://example.com/api/v1/data`

### Request Parameters

Parameter | Default | Required | Type | Description
--------- | --------- | --------- | --------- | ------------
name | none | yes | string | Name of credential to set
type | none | yes | string | Type of credential to set
mode | no-overwrite | no | enum<sup>1</sup> | Overwrite interaction mode
parameters | none | no | object | Generation parameters
parameters.key_length | 2048 | no | enum<sup>2</sup> | Key length of generated credential value
parameters.ssh_comment | none | no | string | SSH comment of generated credential value
additional_permissions | none | no | array | List of additional permissions to set on credential
additional_permissions[].actor | none | no | identity<sup>3</sup> | Actor to provided specified operations on credential
additional_permissions[].operations | none | no | array | List of operations provided on credential to specified actor
additional_permissions[].operations[] | none | no | enum<sup>4</sup> | Operation provided on credential to specified actor

<sup>1</sup> Acceptable modes are 'no-overwrite', 'overwrite', and 'converge' [explained here.](https://credhub-api.cfapps.io/#overwriting-credential-values) <br>
<sup>2</sup> Acceptable key lengths are 2048, 3072, 4096  <br>
<sup>3</sup> Authentication-specific identities [explained here.](https://github.com/cloudfoundry-incubator/credhub/blob/master/docs/authentication-identities.md) <br>
<sup>4</sup> Acceptable operations are 'read', 'write', 'delete', 'read_acl' and 'write_acl'

