# Terraform Key

This action creates a standardized Terraform state key for the given account, application, baseline, and environment using environment variables in the format:

```
aws/<environment>/<account>/application|baseline|<category_name>/<application|baseline>/<key>
```

Any component that is not provided will be omitted from the key. `application`, `baseline`, and `category_name` are mutually exclusive.

## Inputs

- `environment`

  The name of environment to use in the Terraform state key.

  - Type: string
  - Required: false

- `account`

  The AWS account number to use in the Terraform state key.

  - Type: string
  - Required: false

- `application`
  
  The name of the application to use in the Terraform state key.

  - Type: string
  - Required: false
  - Conflicts with: `baseline`, `category_name`

- `baseline`

  The name of the baseline to use in the Terraform state key.

  - Type: string
  - Required: false
  - Conflicts with: `application`, `category_name`

- `category_name`

  The name of the category to use in the Terraform state key.

  - Type: string
  - Required: false
  - Conflicts with: `application`, `baseline`

- `key`

  The key to use in the Terraform state key.

  - Type: string
  - Required: false

## Outputs

- `key`

  The Terraform state key.

  - Type: string

## Example usage

### Basic usage

```yaml
- name: Create Terraform state key
  uses: clalexander/aws-terraform-devops/github-actions/terraform-key@v1
  with:
    environment: dev
    account: 123456789012
    application: myapp
```

Outputs
  - key: `aws/dev/123456789012/application/myapp`

### Pattern usage

You can use a wildcard character to create a pattern for the Terraform state key. This is useful for creating a pattern for a specific environment or account.

```yaml
- name: Create Terraform state key pattern
  uses: clalexander/aws-terraform-devops/github-actions/terraform-key@v1
  with:
    environment: "*"
    baseline: account-baseline
```

Outputs
  - key: `aws/*/baseline/account-baseline`
