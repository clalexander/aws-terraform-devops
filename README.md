# Terraform Devops

### TODO

- [ ] Add GitHub Actions to README.md
- [ ] Add scripts to README.md
- [X] Add Terraform outputs to apply and in own action
- [ ] Update Terraform actions
  - [ ] Generalize inputs for multiple providers/backends
  - [ ] Generalize for multiple remote state key patterns

## GitHub Actions

### Terraform Apply

```yaml
- uses: tf-apply
  env:
    # Terraform variables
    TF_VAR_variable: ''

  with:
    # The Terraform version to use
    # Default: ">= 1.5"
    terraform-version: ''

    # The working directory where the Terraform configuration is located
    # Default: ./terraform
    working-directory: ''

    # The AWS account ID to where the resources will be deployed
    aws-account: '' (required)

    # The AWS region to where the resources will be deployed
    aws-region: '' (required)

    # The AWS access key ID to use for authentication
    aws-access-key-id: '' (required)

    # The AWS secret access key to use for authentication
    aws-secret-access-key: '' (required)

    # The AWS access key ID to use for remote state authentication
    remote-state-access-key: '' (required)

    # The AWS secret access key to use for remote state authentication
    remote-state-secret-key: '' (required)

    # The AWS region to use for remote state authentication
    remote-state-region: '' (required)
    
    # The AWS S3 bucket to use for remote state
    remote-state-bucket: '' (required)

    # The AWS DynamoDB table to use for remote state locking
    remote-state-lock-table: '' (required)

    # The environment to use in the Terraform state key
    tfkey-environment: '' (required)

    # The application to use in the Terraform state key
    tfkey-application: '' (required if tfkey-baseline is not provided)
    
    # The baseline to use in the Terraform state key
    tfkey-baseline: '' (required if tfkey-application is not provided)

    # The options to pass to Terraform
    # Default: ""
    terraform-options: ''

    # The options to pass to Terraform Init
    # Default: ""
    terraform-init-options: '' 

    # Whether to include sensitive terraform outputs in the output. "true" to include sensitive outputs.
    # Default: ""
    terraform-sensitive-outputs: ''
```

- Terraform Init
- Terraform Apply

## Scripts

- Scripts
- Local setup and usage
