# Terraform Setup

The `terraform-setup` action is used to setup Terraform for use in actions.

## Usage

```yaml
- uses: clalexander/aws-terraform-devops/github-actions/terraform-setup@v1
  with:
    # The Terraform version to use
    # Default: ">= 1.5"
    terraform-version: ''

    # The working directory where the Terraform configuration is located
    # Default: ./terraform
    working-directory: ''

    # [Deprecated] The AWS account ID to where the resources will be deployed (unused)
    aws-account: ''

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
    # Default: ''
    terraform-options: ''
```
