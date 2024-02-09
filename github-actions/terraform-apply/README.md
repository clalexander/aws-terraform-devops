# Terraform Apply

The `terraform-apply` action is used to apply the Terraform configuration to the specified AWS account and region.

## Usage

```yaml
- uses: clalexander/aws-terraform-devops/github-actions/terraform-apply@v1
  env:
    # Terraform variables
    # Terraform variables from the environment that start with "TF_VAR_"
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
    # Default: ''
    terraform-options: ''

    # The options to pass to Terraform Init
    # Default: ''
    terraform-init-options: '' 

    # Whether to include terraform outputs in the output. "true" to include all outputs.
    # Default: 'true'
    include-outputs: ''

    # Whether to include sensitive terraform outputs in the output. "true" to include sensitive outputs.
    # Default: ''
    include-sensitive-outputs: ''
```

## Outputs

| Output Parameters | Description                                                            |
| ----------------- | ---------------------------------------------------------------------- |
| terraform-output  | The output from the `terraform output -json` command, as a json string |
