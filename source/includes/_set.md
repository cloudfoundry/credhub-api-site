# Set Credentials

## Type: Value

> CredHub CLI

```shell
user$ credhub set --type value --name '/example-value' --value 'sample'
id: 67fc3def-bbfb-4953-83f8-4ab0682ad675
type: value
name: /example-value
value: sample
version_created_at: 2017-01-01T04:07:18Z
```

> cURL

```shell
curl "https://example.com/api/v1/data" \
  -X PUT \
  -d '{
      "name": "/example-value",
      "type": "value",
      "value": "sample"
     }' \
  -H "authorization: bearer [token]" \
  -H 'content-type: application/json'
```

```json
{
  "id": "67fc3def-bbfb-4953-83f8-4ab0682ad675",
  "name": "/example-value",
  "type": "value",
  "value": "sample",
  "version_created_at": "2017-01-01T04:07:18Z"
}
```

This request sets a value credential with a user-provided value.

### HTTP Request

`PUT: https://example.com/api/v1/data`

### Request Parameters

Parameter | Default | Required | Type | Description
--------- | --------- | --------- | --------- | ------------
name | none | yes | string | Name of credential to set
type | none | yes | string | Type of credential to set
mode | no-overwrite | no | enum<sup>1</sup> | Overwrite interaction mode
value | none | yes | string | Value of credential to set
additional_permissions | none | no | array | List of additional permissions to set on credential
additional_permissions[].actor | none | no | identity<sup>2</sup> | Actor to provided specified operations on credential
additional_permissions[].operations | none | no | array | List of operations provided on credential to specified actor
additional_permissions[].operations[] | none | no | enum<sup>3</sup> | Operation provided on credential to specified actor

<sup>1</sup> Acceptable modes are 'no-overwrite' and 'overwrite' [explained here.](https://credhub-api.cfapps.io/#overwriting-credential-values) <br>
<sup>2</sup> Authentication-specific identities [explained here.](https://github.com/cloudfoundry-incubator/credhub/blob/master/docs/authentication-identities.md) <br>
<sup>3</sup> Acceptable operations are 'read', 'write', 'delete', 'read_acl' and 'write_acl'

## Type: JSON

> CredHub CLI

```shell
user$ credhub set --type json --name '/example-json' --value '{ "key": 123, "key_list": ["val1","val2"], "is_true": true }'
id: 67fc3def-bbfb-4953-83f8-4ab0682ad675
type: json
name: /example-json
value:
  key: 123
  key_list:
  - val1
  - val2
  is_true: true
version_created_at: 2017-01-01T04:07:18Z
```

> cURL

```shell
curl "https://example.com/api/v1/data" \
  -X PUT \
  -d '{
      "name": "/example-json",
      "type": "json",
      "value": {
        "key": 123,
        "key_list": [
          "val1",
          "val2"
        ],
        "is_true": true
      }
     }' \
  -H "authorization: bearer [token]" \
  -H 'content-type: application/json'
```

```json
{
  "id": "67fc3def-bbfb-4953-83f8-4ab0682ad675",
  "name": "/example-json",
  "type": "json",
  "value": {
    "key": 123,
    "key_list": [
      "val1",
      "val2"
    ],
    "is_true": true
  },
  "version_created_at": "2017-01-01T04:07:18Z"
}
```

This request sets a json credential with a user-provided value.

### HTTP Request

`PUT: https://example.com/api/v1/data`

### Request Parameters

Parameter | Default | Required | Type | Description
--------- | --------- | --------- | --------- | ------------
name | none | yes | string | Name of credential to set
type | none | yes | string | Type of credential to set
mode | no-overwrite | no | enum<sup>1</sup> | Overwrite interaction mode
value | none | yes | object | Value of credential to set
additional_permissions | none | no | array | List of additional permissions to set on credential
additional_permissions[].actor | none | no | identity<sup>2</sup> | Actor to provided specified operations on credential
additional_permissions[].operations | none | no | array | List of operations provided on credential to specified actor
additional_permissions[].operations[] | none | no | enum<sup>3</sup> | Operation provided on credential to specified actor

<sup>1</sup> Acceptable modes are 'no-overwrite' and 'overwrite' [explained here.](https://credhub-api.cfapps.io/#overwriting-credential-values) <br>
<sup>2</sup> Authentication-specific identities [explained here.](https://github.com/cloudfoundry-incubator/credhub/blob/master/docs/authentication-identities.md) <br>
<sup>3</sup> Acceptable operations are 'read', 'write', 'delete', 'read_acl' and 'write_acl'


## Type: Password

> CredHub CLI

```shell
user$ credhub set --type password --name '/example-password' --value '3t6Y2OFP0jQIcLnki1h7p3NtSfDx4l9bamr1ja6R'
id: 67fc3def-bbfb-4953-83f8-4ab0682ad675
type: password
name: /example-password
value: 3t6Y2OFP0jQIcLnki1h7p3NtSfDx4l9bamr1ja6R
version_created_at: 2017-01-01T04:07:18Z
```

> cURL

```shell
curl "https://example.com/api/v1/data" \
  -X PUT \
  -d '{
      "name": "/example-password",
      "type": "password",
      "value": "3t6Y2OFP0jQIcLnki1h7p3NtSfDx4l9bamr1ja6R"
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

This request sets a password credential with a user-provided value.

### HTTP Request

`PUT: https://example.com/api/v1/data`

### Request Parameters

Parameter | Default | Required | Type | Description
--------- | --------- | --------- | --------- | ------------
name | none | yes | string | Name of credential to set
type | none | yes | string | Type of credential to set
mode | no-overwrite | no | enum<sup>1</sup> | Overwrite interaction mode
value | none | yes | string | Value of credential to set
additional_permissions | none | no | array | List of additional permissions to set on credential
additional_permissions[].actor | none | no | identity<sup>2</sup> | Actor to provided specified operations on credential
additional_permissions[].operations | none | no | array | List of operations provided on credential to specified actor
additional_permissions[].operations[] | none | no | enum<sup>3</sup> | Operation provided on credential to specified actor

<sup>1</sup> Acceptable modes are 'no-overwrite' and 'overwrite' [explained here.](https://credhub-api.cfapps.io/#overwriting-credential-values) <br>
<sup>2</sup> Authentication-specific identities [explained here.](https://github.com/cloudfoundry-incubator/credhub/blob/master/docs/authentication-identities.md) <br>
<sup>3</sup> Acceptable operations are 'read', 'write', 'delete', 'read_acl' and 'write_acl'


## Type: User

> CredHub CLI

```shell
user$ credhub set --type user --name '/example-user' --username 'FQnwWoxgSrDuqDLmeLpU' --password '6mRPZB3bAfb8lRpacnXsHfDhlPqFcjH2h9YDvLpL'
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
  -X PUT \
  -d '{
      "name": "/example-user",
      "type": "user",
      "value": {
        "username": "FQnwWoxgSrDuqDLmeLpU",
        "password": "6mRPZB3bAfb8lRpacnXsHfDhlPqFcjH2h9YDvLpL"
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
    "password": "6mRPZB3bAfb8lRpacnXsHfDhlPqFcjH2h9YDvLpL",
    "password_hash": "$6$uu8ybZiNiPRu$6AYClxVqMXA3LAIdDAnEuWLUlWGlm0RRJI2wdHd8R9hKkKtiYupyKBjdRBI1ZhsyHwYetCpySew9ZXXLf.Mih0"
  },
  "version_created_at": "2017-01-05T01:01:01Z"
}
```

This request sets a user credential with a user-provided value.

### HTTP Request

`PUT: https://example.com/api/v1/data`

### Request Parameters

Parameter | Default | Required | Type | Description
--------- | --------- | --------- | --------- | ------------
name | none | yes | string | Name of credential to set
type | none | yes | string | Type of credential to set
mode | no-overwrite | no | enum<sup>1</sup> | Overwrite interaction mode
value | none | yes | object |
value.username | null | no | string | Username value of credential to set
value.password | none | yes | string | Password value of credential to set
additional_permissions | none | no | array | List of additional permissions to set on credential
additional_permissions[].actor | none | no | identity<sup>2</sup> | Actor to provided specified operations on credential
additional_permissions[].operations | none | no | array | List of operations provided on credential to specified actor
additional_permissions[].operations[] | none | no | enum<sup>3</sup> | Operation provided on credential to specified actor

<sup>1</sup> Acceptable modes are 'no-overwrite' and 'overwrite' [explained here.](https://credhub-api.cfapps.io/#overwriting-credential-values) <br>
<sup>2</sup> Authentication-specific identities [explained here.](https://github.com/cloudfoundry-incubator/credhub/blob/master/docs/authentication-identities.md) <br>
<sup>3</sup> Acceptable operations are 'read', 'write', 'delete', 'read_acl' and 'write_acl'


## Type: Certificate

> CredHub CLI

```shell
user$ credhub set --type certificate --name '/example-certificate' --root ./root.pem --certificate ./cert.pem --private ./private.pem
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
  -X PUT \
  -d '{
      "name": "/example-certificate",
      "type": "certificate",
      "value": {
        "ca": "-----BEGIN CERTIFICATE-----\n...\n-----END CERTIFICATE-----",
        "certificate": "-----BEGIN CERTIFICATE-----\n...\n-----END CERTIFICATE-----",
        "private_key": "-----BEGIN RSA PRIVATE KEY-----\n...\n-----END RSA PRIVATE KEY-----"
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

This request sets a certificate credential with a user-provided value.

### HTTP Request

`PUT: https://example.com/api/v1/data`

### Request Parameters

Parameter | Default | Required | Type | Description
--------- | --------- | --------- | --------- | ------------
name | none | yes | string | Name of credential to set
type | none | yes | string | Type of credential to set
mode | no-overwrite | no | enum<sup>1</sup> | Overwrite interaction mode
value | none | yes | object |
value.ca | null | no<sup>2,3</sup> | string | Certificate authority value of credential to set
value.ca_name | null | no<sup>3</sup> | string | Name of CA credential in credhub that has signed this certificate
value.certificate | null | no<sup>2</sup> | string | Certificate value of credential to set
value.private_key | null | no<sup>2</sup> | string | Private key value of credential to set
additional_permissions | none | no | array | List of additional permissions to set on credential
additional_permissions[].actor | none | no | identity<sup>4</sup> | Actor to provided specified operations on credential
additional_permissions[].operations | none | no | array | List of operations provided on credential to specified actor
additional_permissions[].operations[] | none | no | enum<sup>5</sup> | Operation provided on credential to specified actor

<sup>1</sup> Acceptable modes are 'no-overwrite' and 'overwrite' [explained here.](https://credhub-api.cfapps.io/#overwriting-credential-values) <br>
<sup>2</sup> At least one value must be set <br>
<sup>3</sup> 'ca_name' and 'ca' are mutually exclusive values <br>
<sup>4</sup> Authentication-specific identities [explained here.](https://github.com/cloudfoundry-incubator/credhub/blob/master/docs/authentication-identities.md) <br>
<sup>5</sup> Acceptable operations are 'read', 'write', 'delete', 'read_acl' and 'write_acl'

## Type: RSA

> CredHub CLI

```shell
user$ credhub set --type rsa --name '/example-rsa' --public ./public.pem --private ./private.pem
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
  -X PUT \
  -d '{
      "name": "/example-rsa",
      "type": "rsa",
      "value": {
        "public_key": "-----BEGIN PUBLIC KEY-----\n...\n-----END PUBLIC KEY-----",
        "private_key": "-----BEGIN RSA PRIVATE KEY-----\n...\n-----END RSA PRIVATE KEY-----"
      }
     }' \
  -H "authorization: bearer [token]" \
  -H 'content-type: application/json'
```

```json
{
  "id": "67fc3def-bbfb-4953-83f8-4ab0682ad676",
  "name": "/example-rsa",
  "type": "rsa",
  "value": {
    "public_key": "-----BEGIN PUBLIC KEY-----\n...\n-----END PUBLIC KEY-----",
    "private_key": "-----BEGIN RSA PRIVATE KEY-----\n...\n-----END RSA PRIVATE KEY-----"
  },
  "version_created_at": "2017-01-01T04:07:18Z"
}
```

This request sets a RSA credential with a user-provided value.

### HTTP Request

`PUT: https://example.com/api/v1/data`

### Request Parameters

Parameter | Default | Required | Type | Description
--------- | --------- | --------- | --------- | ------------
name | none | yes | string | Name of credential to set
type | none | yes | string | Type of credential to set
mode | no-overwrite | no | enum<sup>1</sup> | Overwrite interaction mode
value | none | yes | object |
value.public_key | null | no<sup>2</sup> | string | Public key value of credential to set
value.private_key | null | no<sup>2</sup> | string | Private key value of credential to set
additional_permissions | none | no | array | List of additional permissions to set on credential
additional_permissions[].actor | none | no | identity<sup>3</sup> | Actor to provided specified operations on credential
additional_permissions[].operations | none | no | array | List of operations provided on credential to specified actor
additional_permissions[].operations[] | none | no | enum<sup>4</sup> | Operation provided on credential to specified actor

<sup>1</sup> Acceptable modes are 'no-overwrite' and 'overwrite' [explained here.](https://credhub-api.cfapps.io/#overwriting-credential-values) <br>
<sup>2</sup> At least one value must be set  <br>
<sup>3</sup> Authentication-specific identities [explained here.](https://github.com/cloudfoundry-incubator/credhub/blob/master/docs/authentication-identities.md) <br>
<sup>4</sup> Acceptable operations are 'read', 'write', 'delete', 'read_acl' and 'write_acl'

## Type: SSH

> CredHub CLI

```shell
user$ credhub set --type ssh --name '/example-ssh' --public ./public.pem --private ./private.pem
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
  -X PUT \
  -d '{
      "name": "/example-ssh",
      "type": "ssh",
      "value": {
        "public_key": "ssh-rsa AAAAB3NzaC1y...W9RWFM1",
        "private_key": "-----BEGIN RSA PRIVATE KEY-----\n...\n-----END RSA PRIVATE KEY-----"
      }
     }' \
  -H "authorization: bearer [token]" \
  -H 'content-type: application/json'
```

```json
{
  "id": "67fc3def-bbfb-4953-83f8-4ab0682ad676",
  "name": "/example-ssh",
  "type": "ssh",
  "value": {
    "public_key": "ssh-rsa AAAAB3NzaC1y...W9RWFM1",
    "private_key": "-----BEGIN RSA PRIVATE KEY-----\n...\n-----END RSA PRIVATE KEY-----"
  },
  "version_created_at": "2017-01-01T04:07:18Z"
}
```

This request sets a SSH credential with a user-provided value.

### HTTP Request

`PUT: https://example.com/api/v1/data`

### Request Parameters

Parameter | Default | Required | Type | Description
--------- | --------- | --------- | --------- | ------------
name | none | yes | string | Name of credential to set
type | none | yes | string | Type of credential to set
mode | no-overwrite | no | enum<sup>1</sup> | Overwrite interaction mode
value | none | yes | object |
value.public_key | null | no<sup>2</sup> | string | Public key value of credential to set
value.private_key | null | no<sup>2</sup> | string | Private key value of credential to set
additional_permissions | none | no | array | List of additional permissions to set on credential
additional_permissions[].actor | none | no | identity<sup>3</sup> | Actor to provided specified operations on credential
additional_permissions[].operations | none | no | array | List of operations provided on credential to specified actor
additional_permissions[].operations[] | none | no | enum<sup>4</sup> | Operation provided on credential to specified actor

<sup>1</sup> Acceptable modes are 'no-overwrite' and 'overwrite' [explained here.](https://credhub-api.cfapps.io/#overwriting-credential-values) <br>
<sup>2</sup> At least one value must be set  <br>
<sup>3</sup> Authentication-specific identities [explained here.](https://github.com/cloudfoundry-incubator/credhub/blob/master/docs/authentication-identities.md) <br>
<sup>4</sup> Acceptable operations are 'read', 'write', 'delete', 'read_acl' and 'write_acl'


## Bulk Import

> CredHub CLI

```shell
user$ credhub import --file import.yml
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

id: 2ba73fbd-439e-40ef-b005-0e1db8815063
type: password
name: /example-password
value: SqFcE2c0AuRvet2YhrxdFbPtkBmjiq
version_created_at: 2017-01-01T04:07:28Z

id: 22a1e87b-ba0b-4bc9-bb26-4e5fc5fb1b2f
type: value
name: /example-value
value: sample
version_created_at: 2017-01-01T04:07:38Z

Import complete.
Successfully set: 3
Failed to set: 0
```

> Sample Import File

```yml
credentials:
- name: /example-ssh
  type: ssh
  value:
    public_key: ssh-rsa AAAAB3NzaC1y...W9RWFM1
    private_key: |
      -----BEGIN RSA PRIVATE KEY-----
      ...
      -----END RSA PRIVATE KEY-----
- name: /example-password
  type: password
  value: SqFcE2c0AuRvet2YhrxdFbPtkBmjiq
- name: /example-value
  type: value
  value: sample
```

This CLI command sets multiple credentials from an import file. The import file must be in yaml format, with the key `credentials` whose value is a list of credential objects. Each credential must contain a name, type and value. An example is shown to the right.



### HTTP Request

n/a

### Request Parameters

Parameter | Default | Required | Type | Description
--------- | --------- | --------- | --------- | ------------
n/a |  |  |  |

