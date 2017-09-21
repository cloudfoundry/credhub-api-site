# Integrations

## BOSH Director

> BOSH Manifest

```yml
variables:
- name: /example-user
  type: user
  options:
    username: admin
- name: /example-certificate
  type: certificate
  options:
    ca: /root-ca
    common_name: example.com
    alternative_names:
    - example.com
    - www.example.com
- name: example-password
  type: password
  options:
    length: 50

instance_groups:
- name: credhub-db
  instances: 1

  jobs:
  - name: example
    release: example
    properties:
      example:
        tls: ((/example-certificate))
        data_storage:
          type: postgres
          username: ((/example-user.username))
          password: ((/example-user.password))
        admin_password: ((example-password))
```

The integration with the BOSH Director allows you to reference existing or generate new credentials in CredHub. The generation functionality is driven by the `variables` section of the deployment manifest. Each variable in the list must contain a name, type and may contain generation parameters. All types and generation `parameters` offered by the API are supported using the BOSH manifest.

The object `options` passes through directly to the API request object `parameters`. Any parameter, e.g. common_name, alternative_names, duration, listed in the generation request parameters above can be provided in yaml format in the `options` configuration.

## Concourse CI

> Pipeline Configuration

```yml
resources:
- name: credhub-ci
  type: git
  source:
    uri: git@github.com:cloudfoundry-incubator/credhub
    branch: master
    private_key: ((ci-key.private_key))
- name: credhub-files
  type: s3
  source:
    bucket: credhub-example
    access_key_id: ((s3/write/access-key-id))
    secret_access_key: ((s3/write/secret-access-key))

jobs:
- name: credhub-example
  plan:
  - get: credhub-repo
  - task: deploy-something
    file: credhub-repo/tasks/task.yml
    params:
      BOSH_CLIENT: ((bosh-client.username))
      BOSH_CLIENT_SECRET: ((bosh-client.password))
  - put: credhub-files
    params:
      file: file.txt
```

The Concourse integration allows you to provide references to stored CredHub credentials in your pipeline configurations. The syntax for references is `((credential-name))`. For multi-part credentials, like certificates, a single part of the credential can be provided using dot accessors, e.g. `((credential.certificate))` and `((credential.private_key))`. More information can be [found here.](http://concourse.ci/creds.html#credhub)

Concourse does not currently support generation of credentials, so you must set or generate the credentials in CredHub prior to referencing them in your pipeline.
