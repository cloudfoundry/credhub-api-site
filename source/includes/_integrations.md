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

